FROM geographica/gdal2:latest

ENV DEBIAN_FRONTEND noninteractive

# Install required software
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    software-properties-common \
    wget \
    gdal-bin \
    ca-certificates \
    curl \
    gcc \
    git \
    libpq-dev \
    libgeos-dev \
    libgdal-dev \
    python-gdal \
    make \
    python3-pip \
    ssh \
    supervisor \
    && apt-get autoremove -y \
    && apt-get clean

update-alternatives --install /usr/bin/python python /usr/bin/python3 10
