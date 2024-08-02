with
    transform as (
        select
            cast(salesreasonid as int) as pk_motivo_venda
            , cast(name as varchar) as motivo_venda
            , cast(reasontype as varchar) as tipo_motivo
        from {{ source('raw_adventure_works', 'salesreason') }}
    )
select *
from transform