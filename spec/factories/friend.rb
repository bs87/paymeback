FactoryGirl.define do

factory :friend, class: 'Friend' do
friend_id "11"
user_id "10"
accepted "true"
end
end

#FactoryGirl.define do
#	factory :friend2, class: 'Friend' do
#		friend_id "12"
#		user_id "10"
#		accepted "true" 
#	end
#end

FactoryGirl.define do
	factory :friendanfrage, class: 'Friend' do
		friend_id "10"
		user_id "13"
		accepted "false" 
	end
end

FactoryGirl.define do
factory :user, class: 'User' do

id 10 
email 'dummy24@paymeback.de'
firstname 'dummy'
lastname 'dummy'
adress 'hafenstrasse 12'
zip '48143'
city 'muenster'
password 'hackme!!'
password_confirmation 'hackme!!'
dateofbirth {DateTime.now}
end
end

FactoryGirl.define do
factory :user1, class: 'User' do
id 11
email 'dummy1@paymeback.de'
firstname 'dummy1'
lastname 'dummy1'
zip '48143'
password 'hackme!!'
password_confirmation 'hackme!!'
dateofbirth {DateTime.now}
end
end

FactoryGirl.define do
factory :user2, class: 'User' do
id 12
email 'dummy124@paymeback.de'
firstname 'dummy12'
lastname 'dummy12'
adress 'hafenstrasse 12'
zip '48143'
city 'muenster'
password 'hackme!!'
password_confirmation 'hackme!!'
dateofbirth {DateTime.now}
end
end

FactoryGirl.define do
factory :user3, class: 'User' do
id 13
email 'dummy1424@paymeback.de'
firstname 'dummy21'
lastname 'dummy21'
adress 'hafenstrasse 12'
zip '48143'
city 'muenster'
password 'hackme!!'
password_confirmation 'hackme!!'
dateofbirth {DateTime.now}
end
end



FactoryGirl.define do
factory :nachricht, class: 'Nachrichten' do
id 23
sentby '11'
sentto '10'
topic 'test'
body 'Hallo Welt'
end
end

