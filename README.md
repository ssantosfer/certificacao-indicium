## Desafio

### Descrição dos Dados:

A Adventure Works possui um banco de dados transacional (PostgreSQL) que armazena os dados de suas diferentes áreas. Esses dados estão distribuídos em 68 tabelas divididas em 5 schemas: HR (recursos humanos), sales (vendas), production (produção) e purchasing (compras).

![image](https://github.com/user-attachments/assets/c3c366bc-ef79-4060-85ac-15adb1f7b16d)


### Entrega:

**1 -** Diagrama conceitual do data warehouse em formato PDF: crie o modelo conceitual com as tabelas de fatos e dimensões necessárias para responder às perguntas de negócio do item 4. Mostrar de forma resumida quais as tabelas fonte que foram utilizadas para criar cada dimensão e a tabela fato. (Sugestão de ferramenta: draw.io)

**2 -** Configuração de um data warehouse na nuvem e configuração do dbt. Sugestão: Snowflake e dbt Cloud.

**3 -** Transformação de dados: transforme os dados brutos utilizando o dbt (sugestão: dbt Cloud). Essa transformação deve incluir os seguintes pontos:

a - documentação das tabelas e colunas nos marts

b - testes de sources

c - testes nas primary keys das tabelas de dimensão e fatos

d - teste de dados (lembro do pedido do Carlos)

e - O código precisa estar em um repositório (sugestão: github). Você deve disponibilizar o link do repositório no Github.

**4 -** Painéis de BI: crie em uma ferramenta à sua escolha, mas que permita você responder as seguintes perguntas de negócio:
a - Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

b - Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país? (ticket médio = Faturamento bruto - descontos do produto / número de pedidos no período de análise)

c - Quais os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?

d - Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

e - Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano (dica: gráfico de série de tempo)?

f - Qual produto tem a maior quantidade de unidades compradas para o motivo de venda “Promotion”?

**5 -** Vídeo: você deverá gravar um vídeo apresentando todas as etapas do projeto (DW, EL, transformação em dbt e BI). Crie com alguma ferramenta de gravação, como o Nimbus ou OBS Studio. O vídeo não deve ter duração maior que 10 minutos. Você pode usar o youtube ou outro portal se desejar.

### Resultados:

