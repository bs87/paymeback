describe "the signup process", :type => :feature do
  before :each do
    User.new(:email => 'user@example.com', :password => 'Test1234', :password_confirmation =>'Test1234')
  end

  it "signs me in" do
    visit '/accounts/sign_in'
    within("#session") do
      fill_in ':email', :with => 'user@example.com'
      fill_in ':Password', :with => 'Test1234'
    end
    click_link 'Anmelden'
    page.should have_content 'Success'
  end
end