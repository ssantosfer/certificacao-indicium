with
    address as (
        select
            pk_endereco
            , fk_estado
            , nome_endereco
            , cep
            , nome_cidade
        from {{ ref('stg_adventure_works__addresses') }}
    )
    , state_province as (
        select
            pk_estado
            , fk_territorio
            , fk_regiao_pais
            , nome_estado
            , codigo_estado
        from {{ ref('stg_adventure_works__states_provinces') }}
    )
    , country_region as (
        select
            pk_pais
            , nome_pais
        from {{ ref('stg_adventure_works__country_region') }}
    )
    , union_tables as (
        select
            address.pk_endereco
            , address.nome_endereco
            , address.cep
            , address.nome_cidade
            , state_province.nome_estado
            , state_province.codigo_estado
            , country_region.nome_pais
        from address
        left join state_province on address.fk_estado = state_province.pk_estado
        left join country_region on state_province.fk_regiao_pais = country_region.pk_pais
    )
select *
from union_tables