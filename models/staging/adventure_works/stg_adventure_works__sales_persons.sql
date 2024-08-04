with
    transform as (
        select
            cast(businessentityid as int) as pk_unidade_negocio
            , cast(territoryid as int) as fk_territorio
        from {{ source('raw_adventure_works', 'salesperson') }}
    )
select *
from transform