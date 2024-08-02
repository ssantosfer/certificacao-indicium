with
    transform as (
        select
            cast(creditcardid as int) as pk_cartao_credito
            , cast(cardtype as varchar) as tipo_cartao
        from {{ source('raw_adventure_works', 'creditcard') }}
    )
select *
from transform