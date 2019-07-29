FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git automake autoconf libtool build-essential

RUN git clone https://github.com/pmariglia/gambit.git /gambit

WORKDIR /gambit

RUN aclocal && libtoolize && automake --add-missing && autoconf

RUN ./configure && make && make install

WORKDIR /

RUN rm -rf /gambit

