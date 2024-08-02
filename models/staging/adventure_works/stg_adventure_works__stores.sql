with
    transform as (
        select
            cast(businessentityid as int) as pk_loja
            , cast(salespersonid as varchar) as fk_salesperson
            , cast(name as varchar) as nome_loja
        from {{ source('raw_adventure_works', 'store') }}
    )
select *
from transform