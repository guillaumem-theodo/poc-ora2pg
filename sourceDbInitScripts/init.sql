## CREATE TWO TABLES WITH FAKE DATA

CREATE TABLE pet_owner (id INTEGER AUTO_INCREMENT NOT NULL, name VARCHAR(20) NOT NULL, PRIMARY KEY (id)) ;

INSERT INTO pet_owner (name) VALUES ('john');
INSERT INTO pet_owner (name) VALUES ('jack');
INSERT INTO pet_owner (name) VALUES ('averell');

CREATE TABLE pet (id INTEGER AUTO_INCREMENT NOT NULL,  name VARCHAR(20) NOT NULL collate 'ascii_general_ci',
        owner INTEGER NOT NULL, species VARCHAR(20), sex CHAR(1), birth DATE, death DATE,
                  PRIMARY KEY (id),
                  FOREIGN KEY (owner) REFERENCES pet_owner(id)
                  );


INSERT INTO pet (name, owner, species, sex) VALUES ('choupi', (SELECT id from pet_owner where pet_owner.name='john'), 'dog', 'M');
INSERT INTO pet (name, owner, species, sex) VALUES ('choupette', (SELECT id from pet_owner where pet_owner.name='jack'), 'dog', 'F');
INSERT INTO pet (name, owner, species, sex) VALUES ('choupinou', (SELECT id from pet_owner where pet_owner.name='john'), 'cat', 'M');


