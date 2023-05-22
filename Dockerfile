FROM ubuntu:20.04

WORKDIR /work

RUN apt update && apt install -y \
    wget \
    curl \
    vim \
    zip \
    default-jre
RUN apt install -y fastp
RUN apt install -y hisat2
RUN apt install -y samtools
