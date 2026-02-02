FROM python:3.10-slim

# Evita que o Python gere arquivos .pyc e permite logs em tempo real
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Instala dependências do sistema necessárias
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copia e instala as dependências do Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# O dbt por padrão busca o profiles.yml em ~/.dbt/
# Vamos configurar uma variável de ambiente para ele buscar na raiz do projeto
ENV DBT_PROFILES_DIR=/app

# Comando padrão
CMD ["dbt", "--version"]