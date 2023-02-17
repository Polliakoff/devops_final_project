FROM python:3.10

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_APP hello.py
ENV FLASK_ENV development
ENV FLASK_RUN_PORT 8080

EXPOSE 8080

CMD ["flask", "run"]
