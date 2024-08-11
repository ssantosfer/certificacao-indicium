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
    , orders as (
        select
            pk_venda
            , fk_vendedor
            , fk_cliente
        from {{ ref('stg_adventure_works__sales_orders_headers') }}
    )
    , union_tables as (
        select
            orders.pk_venda
            , sales_reason.pk_motivo_venda
            , orders.fk_vendedor
            , orders.fk_cliente
            , sales_reason.motivo_venda
            , sales_reason.tipo_motivo
        from orders
        left join order_sales_reason on orders.pk_venda = order_sales_reason.fk_venda
        left join sales_reason on order_sales_reason.fk_motivo_venda = sales_reason.pk_motivo_venda
    )
select *
from union_tables