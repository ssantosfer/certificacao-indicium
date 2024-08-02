with
    transform as (
        select
            cast(countryregioncode as varchar) as pk_pais
            , cast(name as varchar) as nome_pais
        from {{ source('raw_adventure_works', 'countryregion') }}
    )
select *
from transform