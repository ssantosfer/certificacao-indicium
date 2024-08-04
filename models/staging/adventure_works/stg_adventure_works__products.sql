with
    transform as (
        select
            cast(productid as int) as pk_produto
            , cast(productsubcategoryid as int) as fk_sub_categoria
            , cast(productnumber as varchar) as numero_produto
            , cast(name as varchar) as nome_produto
        from {{ source('raw_adventure_works', 'product') }}
    )
select *
from transform