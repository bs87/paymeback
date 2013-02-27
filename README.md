paymeback
=========


Installation
=========
Repository auf lokalen Rechner clonen:

 git clone https://github.com/bs87/paymeback.git
In den Ordner paymeback wechseln:

 cd paymeback


Gemset anlegen und benutzen:

 rvm gemset create paymeback
 rvm gemset use paymeback
Gems auf den aktuellsten Stand bringen:

 gem update
 gem install rails
paymeback spezifische Gems installieren:

 bundle install
Datenbank und Testdaten anlegen:

 rake db:reset
 rake db:test:prepare
paymeback starten:

  rails s


Heroku
http://paymeback.herokuapp.com/

Rails
Version: 3.2.12

Verwendete Gems
