with transform as (
    select
        pk_endereco
        , nome_endereco
        , cep
        , nome_cidade
        , nome_estado
        , codigo_estado
        , nome_pais
    from {{ ref('int_adventure_works__addresses') }}
)
select *
from transform