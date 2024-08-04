with
    transform as (
        select
            cast(salesorderid as int) as fk_venda
            , cast(salesreasonid as int) as fk_motivo_venda
        from {{ source('raw_adventure_works', 'salesorderheadersalesreason') }}
    )
select *
from transform