require 'spec_helper'

feature 'Creating Projects' do
	scenario "can create a project" do
	  visit '/'
	  click_link 'New Project'
	  fill_in 'project_name', :with => 'TextMate 2'
	  fill_in 'project_description', :with => "A text-editor for OS X"
	  click_button 'submit_project'
	  page.should have_content('Project has been created')
	end 
end