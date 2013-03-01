FactoryGirl.define do

factory :debit1, class: 'Debit' do
id 1
emailcurrentuser "dummy24@paymeback.de"
emailuser2 "dummy1@paymeback.de"
firstname "Dummy"
betrag 20
art "Geliehen"
info "Test Debit"
end

factory :debit2, class: 'Debit' do
id 2
emailcurrentuser "dummy1@paymeback.de"
emailuser2 "dummy24@paymeback.de"
firstname "Dummy"
betrag -20
art "Verliehen"
info "Test Debit"
end
end