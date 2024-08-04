with
    transform as (
        select
            cast(addressid as int) as pk_endereco
            , cast(stateprovinceid as int) as fk_estado
            , cast(addressline1 as varchar) as nome_endereco
            , cast(postalcode as varchar) as cep
            , cast(city as varchar) as nome_cidade
        from {{ source('raw_adventure_works', 'address') }}
    )
select *
from transform