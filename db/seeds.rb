# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

	flo = User.create email:'flo@admin.de', firstname:'Flo', lastname:'Kopp', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hellmannsweg 19', :zip '46499', :city 'Hamminkeln', :dateofbirth '1988-07-20'

	admin = User.create email:'admin@admin.de', firstname:'Admin', lastname:'Administrator', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hoststrasse 1', :zip '13371', :city 'Adminhausen', :dateofbirth '1900-01-01'
	admin.add_role :admin
	bjoern = User.create email:'bjoern@admin.de', firstname:'Bjoern', lastname:'Simon', password:'Test1234', password_confirmation: 'Test1234', adress: 'Steinfurterstrasse 80', :zip '48153', :city 'Münster', :dateofbirth '1987-01-05'
	lukas = User.create email:'lukas@admin.de', firstname:'Lukas', lastname:'Koopmann', password:'Test1234', password_confirmation: 'Test1234', adress: 'Warendorferstrasse 56', :zip '48151', :city 'Münster', :dateofbirth '1990-09-05'
	sabri = User.create email:'sabri@admin.de', firstname:'Sabri', lastname:'Koch', password:'Test1234', password_confirmation: 'Test1234', adress: 'Hauptstrasse 5', :zip '48143', :city 'Münster-Albachten', :dateofbirth '1988-01-02'
	lennard = User.create email:'lennard@admin.de', firstname:'Lennard', lastname:'Gudd', password:'Test1234', password_confirmation: 'Test1234', adress: 'Verbindungsstrasse 7', :zip '48146', :city 'Münster', :dateofbirth '1989-03-20'
	andre = User.create email:'andre@admin.de', firstname:'Andre', lastname:'Konetzka', password:'Test1234', password_confirmation: 'Test1234', adress: 'Sassendorferstrasse 12', :zip '47123', :city 'Bad Sassendorf', :dateofbirth '1990-10-15'
	Role.create name: 'reguser'
	admin.add_role :admin
	flo.add_role :reguser
	

