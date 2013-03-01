#paymeback
Mit Paymeback können Sie ganz einfach verwalten wem Sie Geld geliehen haben und wer Ihnen Geld geliehen hat. 


##Installation
* Repository auf lokalen Rechner clonen:
			
			git clone https://github.com/bs87/paymeback.git

* In den Ordner paymeback wechseln:
			
			cd paymeback

* Gemset anlegen und benutzen:
			
			rvm gemset create paymeback
 			rvm gemset use paymeback

* Gems auf den aktuellsten Stand bringen:
 		
 			gem update
 			gem install rails

* paymeback spezifische Gems installieren:
 			
 			bundle install

* Datenbank und Testdaten anlegen:
 			
 			rake db:reset
 			rake db:test:prepare

* ImageMagick installieren:
  			
  			sudo apt-get install imagemagick imagemagick-doc

* paymeback starten:
  			
  			rails s

##Start
==========
###Anmeldung

Wir haben folgende Benutzer angelegt:
* Emailadresse: peter@paymeback.de, Passwort: Test1234
* Emailadresse: thomas@paymeback.de, Passwort: Test1234 <br><br>
Diese Benutzer haben die Rolle user und können andere Benutzerkonten nicht verwalten, <br>
hierfür gibt es noch folgenden Benutzer:
* Emailadresse: admin@admin.de, Passwort: Test1234

###Debits
Hier können Nutzer ihre Schulden verwalten. 

Funktion
* Es können nur Schulden für Benutzer eingetragen werden, mit denen der Benutzer befreundet ist.
* Es kann ein Fälligkeitsdatum gesetzt werden
* Nur der Erzeuger (Owner) kann Schulden wieder löschen
* Ein Freund erhält automatisch eine Benachrichtung sobald jemand anderes eine Schuld für ihn eingetragen oder verändert hat
* Für jeden Freund gibt es eine Einzelauflistung
* In der Zusammenfassung werden die Beträge einzelner Nutzer gegeneinander verrechnet

###Freunde
Hier werden die Freunde des Benutzers angezeigt.

Funktion:
* angemeldete Benutzer können andere Benutzer als Freunde hinzufügen. 
* diese bekommen dann eine Freundschaftsanfrage, bei dem hinzufügenden Benutzer unter ausstehende Anfragen zu sehen.
* Eine Anfrage kann entweder angenommen oder abgelehnt werden.
* Die Freundschaft kann von beiden Benutzern beendet werden.


###Nachrichten
Hier findet man das Kommunikationszentrum der Benutzer

Funktion:
* angemeldete Benutzer können anderen Benutzern Nachrichten schicken.
* Unter gesendete und empfangene Nachrichten werden alle Nachrichten des Benutzers angezeigt.
* Nachrichten können z.B. über das Profil eines Benutzers oder über die Details einer Schuld erstellt werden.
* 

##Heroku
==========
http://paymeback.herokuapp.com/


##Verwendete Gems
==========
* rspec-rails (2.13.0)
* faker (1.1.2)
* guard-rspec (2.4.1)
* factory_girl_rails (4.2.1)
* sqlite3 (1.3.7)
* cancan (1.6.9)
* pg (0.14.1)
* sass-rails (3.2.6)
* coffee-rails (3.2.2)
* therubyracer (0.11.3)
* twitter-bootstrap-rails (2.2.4)
* less-rails (2.2.6)
* uglifier (1.3.0)
* devise (2.2.3)
* jquery-rails (2.2.1)
* activeadmin (0.5.1)
* rolify (3.2.0)
* paperclip (3.4.1)
* paperclip-dropbox (1.1.2)
* rails3-jquery-autocomplete (1.0.11)
* jquery-ui-bootstrap-rails (0.0.2)
* jquery-ui-themes (0.0.8)