FactoryGirl.define do
	factory :friend do
		friend_id "2"
		user_id "1"
	end
end

FactoryGirl.define do
 factory :user do	
 email 'dummy@paymeback.de'
 firstname 'dummy'
 lastname 'dummy'
 zip '48143'
 password 'hackme!!'
 password_confirmation 'hackme!!'
end
end

