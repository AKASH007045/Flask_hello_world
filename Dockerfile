FROM python:3.8-slim-buster
WORKDIR /app
RUN apt-get update -y
RUN apt-get install curl telnet -y
COPY requirements.txt requirements.txt
RUN pip install gunicorn
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 8000 80
CMD ["gunicorn app:app"]
