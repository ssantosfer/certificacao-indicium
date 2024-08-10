with
    vendas_em_2011 as (
        select
            sum(total_bruto) as total_bruto
        from {{ ref('fact_sales') }}
        where data_venda between '2011-01-01' and '2011-12-31'
    )
select total_bruto
from vendas_em_2011 

-- Informado pela contabilidade: 12.646.112,16
-- Resultado da minha tabela fato: 12.646.104,41