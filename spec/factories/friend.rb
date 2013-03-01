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
email 'dummy@paymeback.de'
firstname 'dummy'
lastname 'dummy'
zip '48143'
password 'hackme!!'
password_confirmation 'hackme!!'
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

FactoryGirl.define do
 factory :user1, class: 'User' do
 id 11
 email 'dummy1@paymeback.de'
 firstname 'dummy1'
 lastname 'dummy1'
 zip '48143'
 password 'hackme!!'
 password_confirmation 'hackme!!'
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

