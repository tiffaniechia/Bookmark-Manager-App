require 'spec_helper'

feature "User adds a new link" do 

  scenario "when browsing the homepage" do 
    expect(Link.count).to eq(0)
    visit '/'
    add_link("http://www.makersacademy.com/", "Makers Academy")
    expect(Link.count).to eq(1)
    link = Link.first
    expect(link.url).to eq("http://www.makersacademy.com/")
    expect(link.title).to eq("Makers Academy")
  end  

end

def add_link(url, title, tags = [])
  within('#new-link') do
    fill_in 'url', :with => url
    fill_in 'title', :with => title
    fill_in 'tags', :with => tags.join(' ')
    click_button 'Add link'
  end 
end  

feature "adds tags to link " do

    scenario "with a few tags" do 
      visit '/'
      add_link("http://www.makersacademy.com/", "Makers Academy", ['education', 'ruby'])
      link = Link.first 
      #we should expect it to contrain instances of Tag object. fixed by mapping the ag instances to the text they contain
      expect(link.tags.map(&:text)).to include("education")
      expect(link.tags.map(&:text)).to include("ruby")
    end  

end