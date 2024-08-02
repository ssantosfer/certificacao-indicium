with
    transform as (
        select
            cast(productcategoryid as int) as pk_categoria
            , cast(name as varchar) as nome_categoria
        from {{ source('raw_adventure_works', 'productcategory') }}
    )
select *
from transform