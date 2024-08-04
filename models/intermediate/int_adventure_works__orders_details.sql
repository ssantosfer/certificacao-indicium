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
            order_detail.fk_venda
            , order_detail.fk_produto
            , order_detail.quantidade_vendida
            , order_detail.preco_unitario
            , order_detail.desconto_preco_unitario
            , order_header.pk_venda
            , order_header.fk_vendedor
            , order_header.fk_cartao_credito
            , order_header.fk_cliente
            , order_header.fk_territorio
            , order_header.fk_endereco
            , order_header.data_venda
            , order_header.status
            , order_header.valor_subtotal
            , order_header.valor_frete
            , order_header.valor_taxa
            , order_header.valor_total
        from order_detail
        inner join order_header on order_detail.fk_venda = order_header.pk_venda
    )
select *
from joined