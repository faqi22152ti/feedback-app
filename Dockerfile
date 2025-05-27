FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install flask pytest

EXPOSE 80

CMD ["python", "src/app.py"]
