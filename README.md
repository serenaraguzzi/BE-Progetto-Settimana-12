# BE-Progetto-Settimana-12
GESTIONE CATALOGO LIBRI

Per accedere: http://localhost:8080/swagger-ui.html

Effettuare il login con admin con le seguenti credenziali:

{ "userName" : "admin", "password" : "admin" }

Altrimenti utilizzare le credenziali di user ("userName" : "admin", "password" : "admin").

Utlizzare poi il JWT generato per accedere all'authorize.

E' possibile creare un nuovo utente user o admin con credenziali personali.

Una volta loggati con authorize, i metodi GET sono accessibili sia ad utenti user, che ad utenti admin;

tutti gli altri metodi sono accessibili solo ad utenti admin.

In ogni metodo vi è la descrizione e l'utilizzo per l'inserimento dei dati.

Sono presenti alcuni test base Junit e il database di postgreSQL.

Serena Raguzzi
