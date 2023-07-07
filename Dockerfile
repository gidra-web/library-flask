FROM python:3.11.3-slim-bullseye
COPY ./requirements.txt /app/requirements.txt
EXPOSE 5000
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip \
    && pip install mysqlclient \
    && pip install -r requirements.txt
ENTRYPOINT [ "python" ]
CMD ["app.py" ]