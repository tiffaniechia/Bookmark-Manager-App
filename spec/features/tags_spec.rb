require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'shows tags on homepage' do
   scenario "when opening the homepage" do 
    visit '/links/new'
    add_link('yahoo.com', 'Yahoo', ['bestthingever'])
    visit '/'
     expect(page).to have_content 'bestthingever'
  end 
end

feature 'shows original owner of' do 
  scenario "links on the homepage" do 
    visit '/users/new'
    sign_up('andy@ma.com', '123', '123')
    visit '/links/new'
    add_link('iflscience.com', 'iflscience', ['bestthingever'])
    visit '/'
    expect(page).to have_content 'by andy@ma.com'
  end  
end  

