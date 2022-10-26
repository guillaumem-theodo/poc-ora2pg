#!/usr/bin/env bash
## SHOULD BE LAUNCHED WITHIN migration server ('migration' container)

## EXPORT SCHEMA in files (will be created in schema directory
## TABLES will arrive in ./projects/mig/schema/TABLE
## CONSTRAINTS...
## INDEX...

(cd ./projects/mig || exit; ./export_schema.sh)
