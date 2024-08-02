with
    transform as (
        select
            cast(businessentityid as int) as pk_vendedor
            , cast(firstname as varchar) || ' ' || cast(lastname as varchar) as nome_vendedor
        from {{ source('raw_adventure_works', 'person') }}
    )
select *
from transform