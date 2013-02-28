module IntegrationTestHelper
def sign_in(user)
visit "/"
click_on 'Anmelden'
fill_in "email", with: user.email
fill_in "password", with: 'hackme!!'
click_on 'Jetzt Anmelden'
end
end