# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first


	# Benutzer anlegen
	admin = User.create email:'admin@admin.de', firstname:'Admin', lastname:'Administrator', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hoststrasse 1', :zip => 13371, :city => 'Adminhausen', :dateofbirth => '1900-01-01'
	admin.add_role :admin
	flo = User.create email:'flo@admin.de', firstname:'Flo', lastname:'Kopp', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hellmannsweg 19', :zip  => 46499, :city  => 'Hamminkeln', :dateofbirth => '1988-07-20'
	bjoern = User.create email:'bjoern@admin.de', firstname:'Bjoern', lastname:'Simon', password:'Test1234', password_confirmation: 'Test1234', adress: 'Steinfurterstrasse 80', :zip => 48153, :city => 'Muenster', :dateofbirth => '1987-01-05'
	lukas = User.create email:'lukas@admin.de', firstname:'Lukas', lastname:'Koopmann', password:'Test1234', password_confirmation: 'Test1234', adress: 'Warendorferstrasse 56', :zip => 48151, :city => 'Muenster', :dateofbirth => '1990-09-05'
	sabri = User.create email:'sabri@admin.de', firstname:'Sabri', lastname:'Koch', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hauptstrasse 5', :zip => 48143, :city => 'Muenster-Albachten', :dateofbirth => '1988-01-02'
	lennard = User.create email:'lennard@admin.de', firstname:'Lennard', lastname:'Gudd', password:'Test1234', password_confirmation: 'Test1234', adress: 'Verbindungsstrasse 7', :zip => 48146, :city => 'Muenster', :dateofbirth => '1989-03-20'
	andre = User.create email:'andre@admin.de', firstname:'Andre', lastname:'Konetzka', password:'Test1234', password_confirmation: 'Test1234', adress: 'Sassendorferstrasse 12', :zip => 47123, :city => 'Bad Sassendorf', :dateofbirth => '1990-10-15'
	manni = User.create email:'manni@admin.de', firstname:'Manni', lastname:'Do', password:'Test1234', password_confirmation:'Test1234', adress:'Hafenweg 15', :zip => 48155, :city => 'Muenster', :dateofbirth => '1990-10-15'
	thomas = User.create email:'thomas@admin.de', firstname:'Thomas', lastname: 'Hollstegge', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hafenweg 14', :zip => 48155, :city => 'Muenster', :dateofbirth => '1980-10-24'
	peter = User.create email:'peter@admin.de', firstname:'Peter', lastname: 'Grosskopf', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hafenweg 14', :zip => 48155, :city => 'Muenster', :dateofbirth => '1980-10-24'
	

	# Freunde und Freundschaftsanfragen hinzufügen
	floadmin = Friend.create :user_id => 2, :friend_id => 1, :accepted => true
	flopeter = Friend.create :user_id => 2, :friend_id => 10, :accepted => true
	flothomas = Friend.create :user_id => 2, :friend_id => 9, :accepted => true
	flolukas = Friend.create :user_id => 2, :friend_id => 4, :accepted => false
	thomaspeter = Friend.create :user_id => 9, :friend_id => 10, :accepted => true
	thomaslukas = Friend.create :user_id => 9, :friend_id => 4, :accepted => false
	thomasbjoern = Friend.create :user_id => 9, :friend_id => 3, :accepted => true
	peterbjoern = Friend.create :user_id => 10, :friend_id => 3, :accepted => true
	peterlukas = Friend.create :user_id => 10, :friend_id => 4, :accepted => false
	andrethomas = Friend.create :user_id => 7, :friend_id => 9, :accepted => false
	andrepeter = Friend.create :user_id	=> 7, :friend_id => 10, :accepted => false


	#Nachrichten tippen
	thomaspetern = Nachrichten.create :sentby => 9, :sentto => 10, :topic => 'Essensgeld', :body => 'Hey, ich bekommen noch Essensgeld von Dir', :read => true
	peterthomann = Nachrichten.create :sentby => 10, :sentto => 9, :topic => 're:Essensgeld', :body => 'Na dann erstell doch einen debit.', :read => true
	thomaspetern2 = Nachrichten.create :sentby => 9, :sentto => 10, :topic => 're:re:Essensgeld', :body => 'Der Debit ist erstellt ;)', :read => false
	

	#Debit eintragen	
	thomaspeterd1 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'peter@admin.de', firstname: 'Peter Grosskopf', info: 'Essensgeld Mittagspause', art: 'Verliehen', betrag: 10, owner: 'thomas@admin.de', datum: '2013-02-14', faelligkeit: '2013-03-01', read: true, gezahlt: false
	peterthomasd1 = Debit.create emailcurrentuser: 'peter@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Essensgeld Mittagspause', art: 'Geliehen', betrag: -10, datum: '2013-02-14', faelligkeit: '2013-03-01', read: false, gezahlt: false
	lukaspeterd1 = Debit.create emailcurrentuser: 'lukas@admin.de', emailuser2: 'peter@admin.de', firstname: 'Peter Grosskopf', info: 'Kuchen', art: 'Verliehen', betrag: 5, owner: 'lukas@admin.de', datum: '2013-02-20', faelligkeit: '2013-04-01', read: true, gezahlt: false
	peterlukasd1 = Debit.create emailcurrentuser: 'peter@admin.de', emailuser2: 'lukas@admin.de', firstname: 'Lukas Koopmann', info: 'Kuchen', art: 'Geliehen', betrag: -5, datum: '2013-02-20', faelligkeit: '2013-04-01', read: false, gezahlt: false
	peterlukasd2 = Debit.create emailcurrentuser: 'peter@admin.de', emailuser2: 'lukas@admin.de', firstname: 'Lukas Koopmann', info: 'Eis essen', art: 'Gehliehen', betrag: -10, datum: '2013-02-23', faelligkeit: '2013-04-01', read: true, gezahlt: false
	lukaspeterd2 = Debit.create emailcurrentuser: 'lukas@admin.de', emailuser2: 'peter@admin.de', firstname: 'Peter Grosskopf', info: 'Eis essen', art: 'Verliehen', betrag: 10, owner: 'lukas@admin.de', datum: '2013-02-23', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomasflod1 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'flo@admin.de', firstname: 'Flo Kopp', info: 'Kino', art: 'Geliehen', betrag: -15, owner: 'thomas@admin.de', datum: '2013-02-19', faelligkeit: '2013-04-01', read: true, gezahlt: false
	flothomasd1 = Debit.create emailcurrentuser: 'flo@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Kino', art: 'Verliehen', betrag: -15, datum: '2013-02-19', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomasflod2 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'flo@admin.de', firstname: 'Flo Kopp', info: 'GoKart fahren', art: 'Verliehen', betrag: 10, owner: 'thomas@admin.de', datum: '2013-02-20', faelligkeit: '2013-04-01', read: true, gezahlt: false
	flothomasd2 = Debit.create emailcurrentuser: 'flo@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'GoKart fahren', art: 'Geliehen', betrag: -10, datum: '2013-02-20', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomasbjoernd1 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'bjoern@admin.de', firstname: 'Bjoern Simon', info: 'Ausflug nach Hamburg', art: 'Geliehen', betrag: -25, owner: 'thomas@admin.de', datum: '2013-02-25', faelligkeit: '2013-04-01', read: true, gezahlt: false
	bjoernthomasd1 = Debit.create emailcurrentuser: 'bjoern@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'AUsflug nach Hamburg', art: 'Verliehen', betrag: -25, datum: '2013-02-25', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomasbjoernd2 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'bjoern@admin.de', firstname: 'Bjoern Simon', info: 'Shoppen', art: 'Verliehen', betrag: 15, owner: 'thomas@admin.de', datum: '2013-02-25', faelligkeit: '2013-04-01', read: true, gezahlt: false
	bjoernthomasd2 = Debit.create emailcurrentuser: 'bjoern@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Shoppen', art: 'Geliehen', betrag: -15, datum: '2013-02-25', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomasbjoernd3 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'bjoern@admin.de', firstname: 'Bjoern Simon', info: 'Send', art: 'Geliehen', betrag: -25, owner: 'thomas@admin.de', datum: '2013-02-28', faelligkeit: '2013-04-01', read: true, gezahlt: false
	bjoernthomasd3 = Debit.create emailcurrentuser: 'bjoern@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Send', art: 'Verliehen', betrag: -25, datum: '2013-02-28', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomaspeterd2 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'peter@admin.de', firstname: 'Peter Grosskopf', info: 'Send', art: 'Verliehen', betrag: 10, owner: 'thomas@admin.de', datum: '2013-02-14', faelligkeit: '2013-04-01', read: true, gezahlt: false
	peterthomasd2 = Debit.create emailcurrentuser: 'peter@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Send', art: 'Geliehen', betrag: -10, datum: '2013-02-14', faelligkeit: '2013-04-01', read: true, gezahlt: false
	thomaspeterd3 = Debit.create emailcurrentuser: 'thomas@admin.de', emailuser2: 'peter@admin.de', firstname: 'Peter Grosskopf', info: 'Essensgeld Mittagspause', art: 'Geliehen', betrag: -30, datum: '2013-02-14', faelligkeit: '2013-04-01', read: true, gezahlt: false
	peterthomasd3 = Debit.create emailcurrentuser: 'peter@admin.de', emailuser2: 'thomas@admin.de', firstname: 'Thomas Hollstegge', info: 'Essensgeld Mittagspause', art: 'Verliehen', betrag: 30, owner: 'peter@admin.de', datum: '2013-02-14', faelligkeit: '2013-04-01', read: false, gezahlt: false
	
	
	
	Role.create name: 'reguser'
	admin.add_role :admin
	flo.add_role :reguser

	

