with
    product as (
        select
            pk_produto
            , nome_produto
            , numero_produto
            , fk_sub_categoria
        from {{ ref('stg_adventure_works__products') }}
    )
    , sub_category as (
        select
            pk_sub_categoria
            , nome_subcategoria
            , fk_categoria
        from {{ ref('stg_adventure_works__product_sub_categories') }}
    )
    , category as (
        select
            pk_categoria
            , nome_categoria
        from {{ ref('stg_adventure_works__product_categories') }}
    )
    , union_tables as (
        select
            product.pk_produto
            , product.nome_produto
            , product.numero_produto
            , sub_category.nome_subcategoria
            , category.nome_categoria
        from product
        left join sub_category on product.fk_sub_categoria = sub_category.pk_sub_categoria
        left join category on sub_category.fk_categoria = category.pk_categoria
    )
select *
from union_tables