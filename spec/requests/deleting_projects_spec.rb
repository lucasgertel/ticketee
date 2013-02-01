require 'spec_helper'

feature "Deleting Projects" do
  
	before do
		sign_in_as!(FactoryGirl.create(:admin_user))
	end

  scenario "Deleting a project" do
  	FactoryGirl.create(:project, name: 'TextMate2')
  	visit '/'
  	click_link 'TextMate2'
  	click_link 'Delete Project'
  	page.should have_content('Project has been deleted')
  end
end
