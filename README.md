TCC: Analytics Engineering & Machine Learning com BigQuery

Este projeto aplica a arquitetura Medallion (Lakehouse) para transformar dados brutos em insights preditivos. Utilizamos o dbt para a camada de engenharia de dados e Python (Jupyter) para a modelagem de Machine Learning, tudo processado no Google Cloud Platform (BigQuery).
1. Arquitetura do Projeto

O projeto segue o fluxo:

    Bronze (Raw): Ingestão do dataset via CSV/Kaggle no BigQuery.

    Silver (Staging): Limpeza, tipagem e padronização usando dbt.

    Gold (Marts): Criação de tabelas analíticas e Feature Store para ML.

    ML Layer: Notebooks Jupyter consumindo dados da camada Gold para treinamento de modelos.

2. Tecnologias Utilizadas

    Armazenamento/Processamento: Google BigQuery

    Transformação de Dados: dbt (data build tool)

    Machine Learning: Python (Pandas, Scikit-Learn)

    Infraestrutura: Docker & Docker Compose

    Versionamento: Git

3. Como Configurar o Ambiente

Como o projeto está containerizado, o setup é idêntico para Windows (via Docker Desktop) e Linux.
Pré-requisitos

    Docker e Docker Compose instalados.

    Uma conta no Google Cloud com um projeto criado.

    Chave JSON da Service Account com permissões de BigQuery Admin/User.