with
    customer as (
        select
            pk_cliente
            , fk_pessoa
            , fk_loja
        from {{ ref('stg_adventure_works__customers') }}
    )
    , business_entity as (
        select
            pk_entidade_negocio
        from {{ ref('stg_adventure_works__businessentity') }}
    )
    , person as (
        select
            pk_entidade_negocio
            , nome_completo
            , tipo_pessoa
        from {{ ref('stg_adventure_works__persons') }}
    )
    , store as (
        select
            pk_entidade_negocio
            , fk_sales_person
            , nome_loja
        from {{ ref('stg_adventure_works__stores') }}
    )
    , person_customer as (
        select
            customer.pk_cliente
            , customer.fk_pessoa
            , 0 as fk_loja
          --  , customer.fk_loja
            , person.nome_completo as nm_cliente
            , 0 as fk_vendedor
            , 'Pessoa Física' as tipo_cliente
        from customer
        inner join person on customer.fk_pessoa = person.pk_entidade_negocio
        where customer.fk_pessoa is not null
    )
    , person_store as (
        select
            customer.pk_cliente
            , customer.fk_pessoa
            , customer.fk_loja
            , store.nome_loja as nm_cliente
            , store.fk_sales_person as fk_vendedor
            , 'Pessoa Juridica' as tipo_cliente
        from customer
        inner join store on customer.fk_loja = store.pk_entidade_negocio
        where customer.fk_pessoa is null
    )
    , union_tables as (
        select *
        from person_customer
        union all
        select *
        from person_store
    )
select *
from union_tables