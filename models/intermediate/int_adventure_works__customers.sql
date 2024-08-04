with
    customer as (
        select
            pk_cliente
            , fk_pessoa
            , fk_loja
            , fk_territorio
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
            , customer.fk_loja
            , customer.fk_territorio
            , person.nome_completo
            , person.tipo_pessoa
        from customer
        inner join person on customer.fk_pessoa = person.pk_entidade_negocio
    )
    , person_store as (
        select
            customer.pk_cliente
            , customer.fk_pessoa
            , customer.fk_loja
            , customer.fk_territorio
            , store.nome_loja
            , store.fk_sales_person
        from customer
        inner join store on customer.fk_loja = store.pk_entidade_negocio
    )
select *
from union_tables