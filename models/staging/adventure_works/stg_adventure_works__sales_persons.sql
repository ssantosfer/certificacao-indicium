with
    transform as (
        select
            cast(businessentityid as int) as fk_business
            , cast(territoryid as int) as fk_territorio
        from {{ source('raw_adventure_works', 'salesperson') }}
    )
select *
from transform