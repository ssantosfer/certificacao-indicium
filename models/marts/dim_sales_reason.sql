with transform as (
    select
        pk_venda
        , fk_vendedor
        , fk_cliente
        , motivo_venda
        , tipo_motivo
    from {{ ref('int_adventure_works__sales_reason') }}
)
select *
from transform