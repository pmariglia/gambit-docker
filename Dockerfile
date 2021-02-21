FROM debian:8-slim

RUN apt-get update && apt-get install -y git automake autoconf libtool build-essential

RUN git clone https://github.com/pmariglia/gambit.git /gambit

WORKDIR /gambit

RUN aclocal && libtoolize && automake --add-missing && autoconf && ./configure && make && make install

WORKDIR /

RUN apt-get remove -y git automake autoconf libtool build-essential && rm -rf /gambit && apt-get -y autoremove && rm -rf /var/lib/apt/lists
