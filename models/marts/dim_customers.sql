with transform as (
    select
        pk_cliente
        , fk_pessoa
        , fk_loja
        , fk_vendedor
        , nm_cliente
        , tipo_cliente
    from {{ ref('int_adventure_works__customers') }}
)
select *
from transform