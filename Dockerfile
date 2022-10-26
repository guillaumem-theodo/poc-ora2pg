FROM ubuntu:latest

RUN apt-get update
## INSTALL perl, make, mysql client, pgsql client, mysql libs
RUN apt-get -yq  install make perl libdbi-perl vim libaio1 libdbd-mysql-perl libdbd-pg-perl postgresql-client

## COPY Oracle instant client
COPY ./instantclient_12_2 instantclient_12_2

## COPY ora2pg tool (sources)
COPY ./ora2pg-23.2 ora2pg-23.2

## BUILD ora2pg tool
RUN cd ora2pg-23.2 && perl Makefile.PL && make && make install

WORKDIR scripts
ENTRYPOINT ["tail", "-f", "/dev/null"]
