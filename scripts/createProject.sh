#!/usr/bin/env bash

## SHOULD BE LAUNCHED WITHIN migration server ('migration' container)
rm -rf projects/mig

## CHECK CONNECTION
ora2pg -t SHOW_VERSION -c ./ora2pg.conf

## CHECK COST
ora2pg -t SHOW_REPORT --estimate_cost -c ./ora2pg.conf

## CREATE A PROJECT named "mig" in projects directory
ora2pg --project_base ./projects --init_project mig --conf ./ora2pg.conf
