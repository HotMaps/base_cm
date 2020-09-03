FROM geographica/gdal2:latest


# Install required software
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    software-properties-common \
    locales \
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
    python-pip \
    ssh \
    supervisor \
    && apt-get autoremove -y \
    && apt-get clean

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
