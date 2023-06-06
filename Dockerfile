FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y \
    wget \
    curl \
    vim \
    default-jre \
    hisat2 \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    gcc \
    make

WORKDIR /opt
RUN wget --no-check-certificate http://opengene.org/fastp/fastp
RUN chmod a+x /opt/fastp && ln -s /opt/fastp /usr/local/bin/fastp

RUN wget --no-check-certificate https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2
RUN tar -xvf samtools-1.15.1.tar.bz2 && rm -rf samtools-1.15.1.tar.bz2

WORKDIR /opt/samtools-1.15.1/
RUN ./configure --prefix=/usr/local/
RUN make -j12 && make install

WORKDIR /opt/samtools-1.15.1/htslib-1.15.1/
RUN make -j && make install

WORKDIR /work
