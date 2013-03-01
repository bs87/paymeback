FactoryGirl.define do
	factory :friend, class: 'Friend' do
		friend_id "11"
		user_id "10"
		accepted "true" 
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
dateofbirth '1980-10-10'
end
end

FactoryGirl.define do
factory :user1, class: 'User' do
id 11
email 'dummy124@paymeback.de'
firstname 'dummy1'
lastname 'dummy1'
adress 'hafenstrasse 12'
zip '48143'
city 'muenster'
password 'hackme!!'
password_confirmation 'hackme!!'
dateofbirth '1980-10-24'
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

FactoryGirl.define do
 factory :user2, class: 'User' do
 id 12
 email 'dummy2@paymeback.de'
 firstname 'dummy2'
 lastname 'dummy2'
 zip '48143'
 password 'hackme!!'
 password_confirmation 'hackme!!'
end
end