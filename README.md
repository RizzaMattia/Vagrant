# Autore
**Mattia Rizza**
I4BC



# Credenziali Database MySQL

**Username:** sito  
**Password:** admin  
**Database Personale:** mattia_rizza



# Informazioni

Il file presente nella directory `SitoWeb` chiamato `index.php` è l'applicativo [Adminer](https://www.adminer.org/).

- **Versione:** 4.8.1 for MySQL
- **Pagina di default di Apache**

## Indirizzi

- **Web:** [192.168.56.10](http://192.168.56.10)
- **Database:** 10.10.20.11


## Spiegazione comando sed (prima volta che lo utilizzo)

sed -i.bak 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf:

sed: Editor di flusso per filtrare e trasformare il testo. \
-i.bak: Questo dice a sed di modificare il file direttamente e creare una copia di backup con estensione .bak prima di applicare le modifiche. \
's/bind-address.*$/bind-address = 0.0.0.0/': Questa è la parte di sostituzione. Trova qualsiasi riga che inizia con bind-address e la cambia in bind-address = 0.0.0.0. \
/etc/mysql/mysql.conf.d/mysqld.cnf: Questo è il file di configurazione di MySQL dove applicare la modifica
