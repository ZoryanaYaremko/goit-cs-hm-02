# Використовуємо базовий образ Python
FROM python:3.9-slim

# Встановлюємо gcc та бібліотеки для роботи з PostgreSQL
RUN apt-get update && apt-get install -y gcc libpq-dev

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл requirements.txt у робочу директорію
COPY requirements.txt .

# Встановлюємо залежності через pip
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо решту файлів застосунку
COPY . .

# Відкриваємо порт 8000 для FastAPI
EXPOSE 8000

# Запускаємо FastAPI через Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]