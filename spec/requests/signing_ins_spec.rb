require 'spec_helper'

feature "Signing Ins" do
  
  before do
  	FactoryGirl.create(:user, email:'lgertel@gmail.com')
  end

  scenario 'Signing in via confirmation' do
  	open_email 'lgertel@gmail.com', with_subject: /Confirmation/
  	click_first_link_in_email
  	page.should have_content('Your account was successfully confirmed')
  	page.should have_content('Signed in as lgertel@gmail.com')
  end
end
