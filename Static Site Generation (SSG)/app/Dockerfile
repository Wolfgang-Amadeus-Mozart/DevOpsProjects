# /app/Dockerfile

FROM python:3.9-slim

WORKDIR /app

# 1. Copia o requirements do PC para o Container
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copia o seu script 'SiteGenerator.py' do PC para dentro do Container
COPY SiteGenerator.py .

# Quando o container rodar, ele executa esse script
CMD ["python", "SiteGenerator.py"]