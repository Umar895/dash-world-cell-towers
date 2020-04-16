FROM python:3.6-slim-jessie

COPY . /src

RUN apt-get clean && \
    apt-get upgrade && \
    apt-get update && \
    apt-get install -y \
    build-essential \
    apt-utils \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    net-tools \
    python3-dev \
    python3-pip \
    libsnappy-dev \
    wget \
    unzip

WORKDIR /src
RUN wget --no-check-certificate -r 'https://docs.google.com/uc?export=download&id=1mOZq24EFI0eNC2xtVEFQyPxVPHLZI9QN' -O data.zip
RUN unzip data.zip

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

EXPOSE 5000
CMD ["python3", "app.py"]
