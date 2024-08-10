with
    order_header as (
        select
            pk_venda
            , fk_vendedor
            , fk_cartao_credito
            , fk_cliente
            , fk_territorio
            , fk_endereco
            , data_venda
            , status
            , valor_subtotal
            , valor_frete
            , valor_taxa
            , valor_total
        from {{ ref('stg_adventure_works__sales_orders_headers') }}
    )
    , order_detail as (
        select
            pk_venda_detalhada
            , fk_venda
            , fk_produto
            , quantidade_vendida
            , preco_unitario
            , desconto_preco_unitario
        from {{ ref('stg_adventure_works__sales_orders_details') }}
    )
    , joined as (
        select
            order_detail.pk_venda_detalhada
            , order_header.pk_venda
            , order_detail.fk_produto
            , order_header.fk_vendedor
            , order_header.fk_cliente
            , order_header.fk_cartao_credito
            , order_header.fk_territorio
            , order_header.fk_endereco
            , order_detail.quantidade_vendida
            , order_detail.preco_unitario
            , order_detail.desconto_preco_unitario
            , order_header.data_venda
            , order_header.status
            , order_header.valor_subtotal
            , order_header.valor_frete
            , order_header.valor_taxa
            , order_header.valor_total 
        from order_detail
        inner join order_header on order_detail.fk_venda = order_header.pk_venda
    )
    , metrics as (
        select
            *
            , cast(preco_unitario * quantidade_vendida as numeric(18,2)) as total_bruto
            , cast(preco_unitario * (1- desconto_preco_unitario) * quantidade_vendida as numeric(18,2)) as total_liquido
            , cast(valor_frete / count(*) over(partition by pk_venda) as numeric(18,2)) as frete_rateado
            , cast(valor_taxa / count(*) over(partition by pk_venda) as numeric(18,2)) as taxa_rateado
            , cast(preco_unitario 
                * (1- desconto_preco_unitario) 
                * quantidade_vendida
                - valor_frete / count(*) over(partition by pk_venda)
                - valor_taxa / count(*) over(partition by pk_venda)
            as numeric(18,2)) as lucro
        from joined
    )
select
    pk_venda_detalhada
    , pk_venda
    , fk_produto
    , fk_vendedor
    , fk_cliente
    , fk_cartao_credito
    , fk_endereco
    , quantidade_vendida
    , preco_unitario
    , desconto_preco_unitario
    , data_venda
    , status
    , valor_frete
    , valor_taxa
    , total_bruto
    , total_liquido
    , frete_rateado
    , taxa_rateado
    , lucro
    , valor_total
from metrics