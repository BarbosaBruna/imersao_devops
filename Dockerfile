FROM python:3.13.5-alpine3.22

WORKDIR /app

# Instala as dependências do sistema
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expondo a porta 8000 para acesso externo padrão
EXPOSE 8000

# Comando para iniciar a aplicação usando Uvicorn
# A aplicação FastAPI será iniciada no arquivo app.py, com o objeto FastAPI chamado "app"
# O servidor Uvicorn será configurado para escutar em todas as interfaces de rede (0.0.0.0)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]