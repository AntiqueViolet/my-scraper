#1. Базовый образ - с чего начинаем (ЯП готовый образ с Python)
FROM python:3.14.6-slim

#2. Рабочая папка внутри контейнера
WORKDIR /app

#3. Копируем в нашу рабочую папку СНАЧАЛА все зависимости (requirements.txt)
COPY requirements.txt .

#4. Установить зависимости
RUN pip install --no-cache-dir -r requirements.txt

#5. Теперь скопируем весь наш код
COPY json4.py .

#6. Команда, запускающая скрипт при старте контейнера
CMD ["python", "json4.py"]

#docker build -t my-scraper . - docker build -t <имя ОБРАЗА> . - Собрать образ из Dockerfile в текущей папке
#docker run my-scraper - docker run <имя ОБРАЗА> - Запустить контейнер из образа
#docker run -d --name scraper1 my-scraper - docker run -d --name <имя КОНТЕЙНЕРА> <имя ОБРАЗА> - -d = detached Запустить контейнер в ФОНЕ и дать имя
#docker run -v ./output:/app/data my-scraper - Том (volume): -v путь_на_серваке:путь_в_контейнере

#docker ps -a - Список ВСЕХ запущенных контейнеров
#docker images - Список ВСЕХ образов
#docker logs <имя КОНТЕЙНЕРА> - логи

#docker stop <имя КОНТЕЙНЕРА> - остановить контейнер
#docker rm -f <имя КОНТЕЙНЕРА> - удалить контейнер
#docker rmi -f <имя ОБРАЗА> - удалить образ

#docker exec -it <имя КОНТЕЙНЕРА> bash - зайти внутрь работающего контейнера (интерактивный терминал)

