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

  scenario 'Signing in via form' do
  	User.find_by_email('lgertel@gmail.com').confirm!
  	visit '/'
  	click_link 'Sign in'
  	fill_in 'Email', with: 'lgertel@gmail.com'
  	fill_in 'Password', with:'password'
  	click_button 'Sign in'
  	page.should have_content('Signed in successfully')
  end
end
