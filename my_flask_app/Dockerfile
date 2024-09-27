FROM python:3.9-slim

WORKDIR /app

COPY ./my_flask_app/requirements.txt requirements.txt
COPY ./my_flask_app/app.py app.py

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
