## POC ora2pg tool

Very good blog [here](https://blog.capdata.fr/index.php/la-migration-oracle-vers-postgresql-avec-ora2pg/).

Ora2pg doc [here](https://ora2pg.darold.net/documentation.html).

1. First UNZIP the four files instantclient-***.zip in a COMMON instantclient_12_2 directory 
   1. Zip files can be downloaded here (you need an Oracle account): [Oracle Download](https://www.oracle.com/fr/database/technologies/instant-client/linux-x86-64-downloads.html)
   2. Use ``installInstantClient.sh``

2. A docker-compose to create 3 containers
   1. a ``source_host`` container with a MYSQL database instance
   2. the MYSQL database is initialised with 2 tables and few data (script in ``./sourceDbInitScripts`` directory)
   3. a ``destination_host`` container with a PGSQL database instance (with no database in it)
   4. a ``migration`` server container (ubuntu based) with all required dependencies to launch ``ora2pg`` tool

To start: ``docker-compose up -d --remove-orphan``  
If you have issues: ``docker-compose stop`` then ``docker system prune -f -a --volumes`` (to clean absolutely everything)


3. Scripts in root directory
   1. first, use ``./createMigrationProject.sh`` (from the localhost) to launch ora2pg project creation from within the migration server.
   2. second, use ``./exportSchema.sh`` (from the localhost) to export mySQL schema and transform it to PG schema. Results will arrive in ``scripts/projects/schema`` directory on the migration server
   3. then, use the interactive ``./importDataInPg.sh`` (from the localhost) to apply migration. You also can use `import_all.sh` (from `migration` container) to have more options 
      1. answer NO to create database and schema
      2. answer YES to create TABLEs
      3. answer YES to load DATA
      4. answer YES to apply INDEXES, then CONSTRAINTS, then FK/PK
