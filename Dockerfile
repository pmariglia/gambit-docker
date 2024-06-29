FROM debian:12-slim as build

RUN apt-get update && apt-get install -y git automake autoconf libtool build-essential

RUN git clone https://github.com/pmariglia/gambit.git /gambit

WORKDIR /gambit

RUN aclocal && libtoolize && automake --add-missing && autoconf && ./configure && make && make install

FROM debian:12-slim

COPY --from=build /usr/local/bin/gambit* /usr/local/bin/

