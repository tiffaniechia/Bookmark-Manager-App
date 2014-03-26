require 'spec_helper'

feature "User adds a new link" do 

  scenario "when browsing the homepage" do 
    expect(Link.count).to eq(0)
    visit '/links/new'
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
    visit '/links/new'
    add_link("http://www.makersacademy.com/", "Makers Academy", ['education', 'ruby'])
    link = Link.first 
    #we should expect it to contrain instances of Tag object. fixed by mapping the ag instances to the text they contain
    expect(link.tags.map(&:text)).to include("education")
    expect(link.tags.map(&:text)).to include("ruby")
  end  

end

feature "filtering by tags" do 


  before(:each) {
    Link.create(:url => "http://www.makersacademy.com",
                :title => "Makers Academy",
                :tags => [Tag.first_or_create(:text => 'education')])

    Link.create(:url => "http://www.google.com",
                :title => "Google",
                :tags => [Tag.first_or_create(:text => 'search')])

    Link.create(:url => "http://bing.com",
                :title => "Bing",
                :tags => [Tag.first_or_create(:text => 'search')])

    Link.create(:url => "http://www.code.org",
                :title => "Code.org",
                :tags => [Tag.first_or_create(:text =>'education')])
  }

  scenario "filtered by a tag" do 
    visit '/tags/search'
    expect(page).not_to have_content("Makers Academy")
    expect(page).not_to have_content("Code.org")
    expect(page).to have_content("Google")
    expect(page).to have_content("Bing")
  end  


end  