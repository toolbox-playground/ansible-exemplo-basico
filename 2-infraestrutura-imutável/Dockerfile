FROM python:3.9-slim

WORKDIR /usr/src/app

RUN pip install --no-cache-dir Flask

COPY . .

EXPOSE 5000

CMD ["python", "./app.py"]