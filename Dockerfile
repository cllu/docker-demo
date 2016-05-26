FROM python:3.5.1
ENV  PYTHONUNBUFFERED 1

RUN mkdir -p /app
WORKDIR /app

RUN pip install --upgrade pip
COPY ./requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

COPY ./demo /app/demo
VOLUME ["/app/demo"]
EXPOSE 8000

COPY ./server.py /app
COPY ./bin/start.sh /app
RUN chmod 755 /app/start.sh
CMD ["/app/start.sh"]
