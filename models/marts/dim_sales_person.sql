with transform as (
    select
        pk_vendedor
        , nome_completo
    from {{ ref('int_adventure_works__sales_person') }}
)
select *
from transform