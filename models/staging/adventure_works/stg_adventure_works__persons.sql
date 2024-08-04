with
    transform as (
        select
            cast(businessentityid as int) as pk_entidade_negocio
            , cast(firstname as varchar) || ' ' || cast(lastname as varchar) as nome_completo
            , cast(persontype as varchar) as tipo_pessoa
        from {{ source('raw_adventure_works', 'person') }}
    )
select *
from transform