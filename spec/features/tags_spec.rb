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