with
    transform as (
        select
            cast(businessentityid as int) as pk_entidade_negocio
        from {{ source('raw_adventure_works', 'businessentity') }}
    )
select *
from transform