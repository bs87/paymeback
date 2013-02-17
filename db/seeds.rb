# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

	flo = User.create email:'flo@admin.de', firstname:'Flo', lastname:'Kopp', password:'Test1234', password_confirmation: 'Test1234'
	admin = User.create email:'admin@admin.de', password:'Test1234', password_confirmation: 'Test1234'
	Role.create name: 'reguser'
	admin.add_role :admin
	flo.add_role :reguser
	
