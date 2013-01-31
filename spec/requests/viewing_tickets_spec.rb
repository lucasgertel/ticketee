require 'spec_helper'

feature "ViewingTickets" do
  before do
    user = FactoryGirl.create(:user, email: "lgertel@gmail.com")
  	textmate_2 = FactoryGirl.create(:project, name: 'TextMate 2')
  	ticket = FactoryGirl.create(	:ticket, 
            											project: textmate_2, 
            											title: 'Make it shiny!',
            											description: 'Gradients! Starbursts! Oh my!')
    ticket.update_attribute(:user, user)

  	internet_explorer = FactoryGirl.create(:project, name:'Internet Explorer')
  	FactoryGirl.create( :ticket,
  											project: internet_explorer,
  											title: 'Standards compliance',
  											description: 'Isn\'t a joke')
  	visit '/'
  end

  scenario "Viewing tickets for a given project" do 
  	click_link 'TextMate 2'
  	page.should have_content('Make it shiny!')
  	page.should_not have_content('Standards compliance')

  	click_link 'Make it shiny!'
  	within('#ticket h2') do
  		page.should have_content('Make it shiny!')
  	end
  	
  	page.should have_content('Gradients! Starbursts! Oh my!')
  end
end
