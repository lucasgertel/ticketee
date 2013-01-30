require 'spec_helper'

feature "Deleting Projects" do
  
  scenario "Deleting a project" do
  	FactoryGirl.create(:project, name: 'TextMate2')
  	visit '/'
  	click_link 'TextMate2'
  	click_link 'Delete Project'
  	page.should have_content('Project has been deleted')
  end
end
