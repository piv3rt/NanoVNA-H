
FROM ubuntu:latest

RUN apt -y update
RUN apt -y install bzip2 vim git wget make

WORKDIR /usr/local
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
RUN tar xjf gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
RUN rm -f gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
ENV PATH=/usr/local/gcc-arm-none-eabi-8-2018-q4-major/bin:$PATH

RUN git clone --branch make-it-compile-reloaded --depth 1 https://github.com/piv3rt/NanoVNA-H.git /NanoVNA-H

WORKDIR /NanoVNA-H
RUN git submodule update --init --recursive
ENTRYPOINT [ "make", "TARGET=F072" ]