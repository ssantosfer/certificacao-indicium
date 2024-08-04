with
    transform as (
        select
            cast(salesorderid as int) as pk_venda
            , cast(salespersonid as int) as fk_vendedor
            , cast(creditcardid as int) as fk_cartao_credito
            , cast(customerid as int) as fk_cliente
            , cast(territoryid as int) as fk_territorio
            , cast(shiptoaddressid as int) as fk_endereco
            , cast(orderdate as date) as data_venda
            , cast(status as int) as status
            , cast(subtotal as numeric(18, 2)) as valor_subtotal
            , cast(freight as numeric(18, 2)) as valor_frete
            , cast(taxamt as numeric(18, 2)) as valor_taxa
            , cast(totaldue as numeric(18, 2)) as valor_total
        from {{ source('raw_adventure_works', 'salesorderheader') }}
    )
select *
from transform