with
    transform as (
        select
            cast(productsubcategoryid as int) as pk_sub_categoria
            , cast(name as varchar) as nome_subcategoria
            , cast(productcategoryid as int) as fk_categoria
        from {{ source('raw_adventure_works', 'productsubcategory') }}
    )
select *
from transform