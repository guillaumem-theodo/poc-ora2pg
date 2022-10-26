#!/usr/bin/env bash
## SHOULD BE LAUNCHED WITHIN migration server ('migration' container)

## IMPORT ALL DATA to PG
## -d name of the database (set in the docker-compose file)
## -o owner (set in the docker-compose file)
## -n schema
## -h hostname of the database (set in the docker-compose file)
## -U user (set in the docker-compose file)
## -x import indexes and constraints after data
##

(cd ./projects/mig || exit; ./import_all.sh -d destination_db -o myDatabaseAdminUser -n public -h destination_host -U myDatabaseAdminUser -x
)

