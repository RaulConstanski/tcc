FROM python:3.10-slim

# Evita que o Python gere arquivos .pyc e permite logs em tempo real
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# --- NOVO: Recebe os IDs do usuário host para evitar erro EACCES ---
ARG USER_ID=1000
ARG GROUP_ID=1000

# Instala dependências do sistema e cria o usuário dbtuser
RUN apt-get update && apt-get install -y git && \
    groupadd -g ${GROUP_ID} dbtuser || true && \
    useradd -l -u ${USER_ID} -g ${GROUP_ID} -m dbtuser || true && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Garante que a pasta /app pertence ao novo usuário
RUN chown -R ${USER_ID}:${GROUP_ID} /app

# Copia e instala as dependências do Python
# (Isso ainda é feito como root para instalar no sistema/venv)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Configura o diretório do dbt
ENV DBT_PROFILES_DIR=/app

# --- NOVO: Troca para o usuário comum antes de rodar o comando ---
USER dbtuser

# Comando padrão
CMD ["dbt", "--version"]