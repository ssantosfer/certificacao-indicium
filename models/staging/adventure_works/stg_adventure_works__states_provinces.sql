with
    transform as (
        select
            cast(stateprovinceid as int) as pk_estado
            , cast(territoryid as int) as fk_territorio
            , cast(countryregioncode as varchar) as fk_regiao_pais
            , cast(name as varchar) as nome_estado
            , cast(stateprovincecode as varchar) as codigo_estado
        from {{ source('raw_adventure_works', 'stateprovince') }}
    )
select *
from transform