with transform as (
    select
        pk_produto
        , nome_produto
        , numero_produto
        , nome_subcategoria
        , nome_categoria
    from {{ ref('int_adventure_works__products') }}
)
select *
from transform