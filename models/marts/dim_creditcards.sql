with transform as (
    select
        pk_cartao_credito
        , tipo_cartao
    from {{ ref('stg_adventure_works__creditcards') }}
)
select *
from transform