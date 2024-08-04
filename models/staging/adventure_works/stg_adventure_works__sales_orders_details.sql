with
    transform as (
        select
            cast(salesorderdetailid as int) as pk_venda_detalhada
            , cast(salesorderid as int) as fk_venda
            , cast(productid as int) as fk_produto
            , cast(orderqty as int) as quantidade_vendida
            , cast(unitprice as numeric(18, 2)) as preco_unitario
            , cast(unitpricediscount as numeric(18, 2)) as desconto_preco_unitario
        from {{ source('raw_adventure_works', 'salesorderdetail') }}
    )
select *
from transform