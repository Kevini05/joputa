-- Titre             : Script SQL (PostgreSQL) de création de la base de données du projet bibliothèque
-- Version           : 1.0
-- Date création     : 07 mars 2006
-- Date modification : 9 avril 2017
-- Auteur            : Philippe TANGUY
-- Description       : Ce script est une ébauche, à compléter, qui permet la création de la table
--                     "livre" pour la réalisation de la fonctionnalité "liste de tous les livres".
--creation_base_de_donnees.sql
drop table if exists "emprunt";
drop table if exists "exemplaire";
drop table if exists "livre";
drop table if exists "abonne";


-- +----------------------------------------------------------------------------------------------+
-- | Création des tables                                                                          |
-- +----------------------------------------------------------------------------------------------+

create table livre
(
  id     serial primary key,
  isbn10 varchar(25) unique,
  isbn13 varchar(25) unique,
  titre  varchar(50) not null,
  auteur varchar(30)
);

create table exemplaire
(
  id        serial primary key,
  id_livre  int not null,
  foreign key (id_livre) references livre(id)
);

create table abonne
(
  id     serial primary key,
  nom    varchar(25) not null,
  prenom varchar(25),
  statut varchar(20),
  email  varchar(50)
);

create table emprunt
(
  id_abonne         int,
  id_livre          int,
  date_emprunt      date,
  date_retour       date, --yyyy-mm-dd
  constraint pk_emprunt primary key (id_abonne,id_livre,date_emprunt),
  foreign key (id_livre) references exemplaire(id),
  foreign key (id_abonne) references abonne(id)
);


-- +----------------------------------------------------------------------------------------------+
-- | Insertion de quelques données de pour les tests                                              |
-- +----------------------------------------------------------------------------------------------+

-- livre
insert into livre values(nextval('livre_id_seq'), '2-84177-042-7', NULL,                'JDBC et JAVA',                            'George REESE');    -- id = 1
insert into livre values(nextval('livre_id_seq'), NULL,            '978-2-7440-7222-2', 'Sociologie des organisations',            'Michel FOUDRIAT'); -- id = 2
insert into livre values(nextval('livre_id_seq'), '2-212-11600-4', '978-2-212-11600-7', 'Le data warehouse',                       'Ralph KIMBALL');   -- id = 3
insert into livre values(nextval('livre_id_seq'), '2-7117-4811-1', NULL,                'Entrepots de données',                    'Ralph KIMBALL');   -- id = 4
insert into livre values(nextval('livre_id_seq'), '2012250564',    '978-2012250567',    'Oui-Oui et le nouveau taxi',              'Enid BLYTON');     -- id = 5
insert into livre values(nextval('livre_id_seq'), '2203001011',    '978-2203001015',    'Tintin au Congo',                         'HERGÉ');           -- id = 6
insert into livre values(nextval('livre_id_seq'), '2012011373',    '978-2012011373',    'Le Club des Cinq et le trésor de l''île', 'Enid BLYTON');     -- id = 7

-- exemplaire
insert into exemplaire values(nextval('exemplaire_id_seq'),1);    -- id = 1
insert into exemplaire values(nextval('exemplaire_id_seq'),2);    -- id = 2
insert into exemplaire values(nextval('exemplaire_id_seq'),2);    -- id = 3
insert into exemplaire values(nextval('exemplaire_id_seq'),2);    -- id = 4
insert into exemplaire values(nextval('exemplaire_id_seq'),3);    -- id = 5
insert into exemplaire values(nextval('exemplaire_id_seq'),3);    -- id = 6
insert into exemplaire values(nextval('exemplaire_id_seq'),3);    -- id = 7
insert into exemplaire values(nextval('exemplaire_id_seq'),4);    -- id = 8
insert into exemplaire values(nextval('exemplaire_id_seq'),5);    -- id = 9
insert into exemplaire values(nextval('exemplaire_id_seq'),6);    -- id = 10
insert into exemplaire values(nextval('exemplaire_id_seq'),7);    -- id = 11
insert into exemplaire values(nextval('exemplaire_id_seq'),7);    -- id = 12
insert into exemplaire values(nextval('exemplaire_id_seq'),7);    -- id = 13
insert into exemplaire values(nextval('exemplaire_id_seq'),7);    -- id = 14

--abonne
insert into abonne values(nextval('abonne_id_seq'), 	'Nguyen', 		'Van-Khoa',         'étudiant',            	'van-khoa@imt.com');    	-- id = 1
insert into abonne values(nextval('abonne_id_seq'), 	'Ducuara',      'Daniel', 			NULL,            		'dducuara@ud.co'); 			-- id = 2
insert into abonne values(nextval('abonne_id_seq'), 	'Agudelo',		'Santiago', 		'master',                NULL);   					-- id = 3
insert into abonne values(nextval('abonne_id_seq'), 	'Ibarra', 		NULL,               'master',                'ksibarra@telecom.eu');   	-- id = 4
insert into abonne values(nextval('abonne_id_seq'), 	'Delaude',      'Luciano',    		'étudiant',              'luciano@facebook.com');   -- id = 5

-- emprunt
insert into emprunt values(1,1,'2018-10-10', NULL);             -- id = 1
insert into emprunt values(1,5,'2017-02-10', '2017-02-28');     -- id = 2
insert into emprunt values(2,3,'2018-02-10', '2018-02-28');     -- id = 3
insert into emprunt values(3,1,'2017-08-10', '2017-08-25');     -- id = 4
insert into emprunt values(3,1,'2018-09-26', NULL);             -- id = 5
insert into emprunt values(4,4,'2016-02-10', '2016-03-08');     -- id = 6
insert into emprunt values(4,4,'2018-10-15', NULL);             -- id = 7
insert into emprunt values(4,8,'2018-10-15', NULL);             -- id = 8