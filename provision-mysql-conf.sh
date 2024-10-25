#!/bin/bash

mysql -e "
  DROP DATABASE IF EXISTS mattia_rizza;
  CREATE DATABASE mattia_rizza;
  USE mattia_rizza;
  CREATE TABLE ruolo(nome VARCHAR(25) PRIMARY KEY, descrizione VARCHAR(255));
  CREATE TABLE utente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25),
    cognome VARCHAR(25),
    username VARCHAR(25),
    password CHAR(64),
    email VARCHAR(50),
    indirizzo VARCHAR(100),
    telefono INT,
    ruolo VARCHAR(25),
    credito INT,
    FOREIGN KEY (ruolo) REFERENCES ruolo(nome) ON DELETE CASCADE,
    INDEX (username)
  );
  CREATE TABLE materia(nome VARCHAR(25) PRIMARY KEY);
  CREATE TABLE corso(
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_username VARCHAR(25),
    utente_id INT,
    materia VARCHAR(25),
    argomento VARCHAR(255),
    costo DOUBLE,
    allieviMassimi INT,
    allieviRegistrati INT,
    disponibileDa DATETIME,
    disponibileA DATETIME,
    FOREIGN KEY (utente_id) REFERENCES utente(id) ON DELETE CASCADE,
    FOREIGN KEY (utente_username) REFERENCES utente(username) ON DELETE CASCADE,
    FOREIGN KEY (materia) REFERENCES materia(nome) ON DELETE CASCADE
  );
  CREATE TABLE richiestacoach(
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_username VARCHAR(25),
    utente_id INT,
    data DATETIME,
    dataModifica DATE,
    stato VARCHAR(25),
    FOREIGN KEY (utente_username) REFERENCES utente(username) ON DELETE CASCADE,
    FOREIGN KEY (utente_id) REFERENCES utente(id) ON DELETE CASCADE,
    INDEX (utente_username)
  );
  CREATE TABLE richiestacorso(
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_username VARCHAR(25),
    materia VARCHAR(25),
    argomento VARCHAR(25),
    disponibileDa DATETIME,
    disponibileA DATETIME,
    FOREIGN KEY (utente_username) REFERENCES utente(username) ON DELETE CASCADE,
    FOREIGN KEY (materia) REFERENCES materia(nome) ON DELETE CASCADE
  );
  CREATE TABLE registrazionecorso(
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_id INT,
    corso_id INT,
    FOREIGN KEY (utente_id) REFERENCES utente(id) ON DELETE CASCADE,
    FOREIGN KEY (corso_id) REFERENCES corso(id) ON DELETE CASCADE
  );
  CREATE TABLE archiviocorsi(
    id INT AUTO_INCREMENT PRIMARY KEY,
    utente_username VARCHAR(25),
    utente_id INT,
    materia VARCHAR(25),
    argomento VARCHAR(255),
    costo DOUBLE,
    allieviMassimi INT,
    allieviRegistrati INT,
    disponibileDa DATETIME,
    disponibileA DATETIME,
    FOREIGN KEY (utente_id) REFERENCES utente(id) ON DELETE CASCADE,
    FOREIGN KEY (utente_username) REFERENCES utente(username) ON DELETE CASCADE,
    FOREIGN KEY (materia) REFERENCES materia(nome) ON DELETE CASCADE
  );

  INSERT INTO ruolo VALUES('Coach', '');
  INSERT INTO ruolo VALUES('Allievo', '');
  INSERT INTO materia VALUES('Italiano');
  INSERT INTO materia VALUES('Tedesco');
  INSERT INTO materia VALUES('Inglese');
  INSERT INTO materia VALUES('Fisica');
  INSERT INTO materia VALUES('Chimica');
  INSERT INTO materia VALUES('Economia');
  INSERT INTO materia VALUES('Storia');
  INSERT INTO materia VALUES('Matematica');
  INSERT INTO materia VALUES('M151');
  INSERT INTO materia VALUES('M146');
  INSERT INTO materia VALUES('M159');
  INSERT INTO materia VALUES('M182');
  INSERT INTO materia VALUES('M141');
  INSERT INTO materia VALUES('M226B');
  INSERT INTO materia VALUES('M223');
  INSERT INTO materia VALUES('M133');
  INSERT INTO materia VALUES('M306');
  INSERT INTO materia VALUES('M426');
  INSERT INTO utente (nome, cognome, username, password) VALUES('Super', 'Admin', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
  INSERT INTO utente (nome, cognome, username, password, ruolo, credito) VALUES('Allievo', 'Prova', 'allievo', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Allievo', 0);
  INSERT INTO utente (nome, cognome, username, password, ruolo, credito) VALUES('Allievo', 'Prova', 'allievo2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Allievo', 0);
  INSERT INTO utente (nome, cognome, username, password, ruolo, credito) VALUES('Coach', 'Prova', 'coach', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Coach', 0);
  INSERT INTO utente (nome, cognome, username, password, ruolo, credito) VALUES('Coach', 'Prova', 'coach2', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Coach', 0);


  CREATE USER 'sito'@'%' IDENTIFIED BY 'admin';
  GRANT ALL ON mattia_rizza.* TO 'sito'@'%';
"
