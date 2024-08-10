with transform as (
    select
        pk_venda_detalhada
        , pk_venda
        , fk_produto
        , fk_vendedor
        , fk_cliente
        , fk_cartao_credito
        , fk_endereco
        , data_venda
        , status
        , quantidade_vendida
        , preco_unitario
        , desconto_preco_unitario
        , total_bruto
        , total_liquido
        , frete_rateado
        , taxa_rateado
        , lucro
        , valor_total
    from {{ ref('int_adventure_works__orders_details') }}
)
select *
from transform