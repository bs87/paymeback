FactoryGirl.define do

factory :debit, class: 'Debit' do
emailcurrentuser "dummy@paymeback.de"
emailuser2 "dummy2@paymeback.de"
firstname "Dummy"
betrag "20"
art "Geliehen"
info "Test Debit"
end
end