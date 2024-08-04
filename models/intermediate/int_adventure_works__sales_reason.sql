with
    sales_reason as (
        select
            pk_motivo_venda
            , motivo_venda
            , tipo_motivo
        from {{ ref('stg_adventure_works__sales_reasons') }}
    )
    , order_sales_reason as (
        select
            fk_venda
            , fk_motivo_venda
        from {{ ref('stg_adventure_works__sales_orders_headers_sales_reasons') }}
    )
    , order as (
        select
            pk_venda
            , fk_vendedor
            , fk_cliente
        from {{ ref('stg_adventure_works__sales_orders_headers') }}
    )
    , union_tables as (
        select
            order.pk_venda
            , order.fk_vendedor
            , order.fk_cliente
            , sales_reason.motivo_venda
            , sales_reason.tipo_motivo
        from order
        left join order_sales_reason on order.pk_venda = order_sales_reason.fk_venda
        left join sales_reason on order_sales_reason.fk_motivo_venda = sales_reason.pk_motivo_venda
    )
select *
from union_tables