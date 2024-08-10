with transform as (
    select
        sales_person.pk_unidade_negocio as pk_vendedor
        , person.nome_completo
    from {{ ref('stg_adventure_works__sales_persons') }} sales_person
    left join {{ ref('stg_adventure_works__persons') }} person
        on sales_person.pk_unidade_negocio = person.pk_entidade_negocio
)
select *
from transform