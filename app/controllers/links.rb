post '/links' do 
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      #this will either find the tag or create it if it doesnt exist
      Tag.first_or_create(:text => tag)
    end  
    Link.create(:url => url, :title => title, :tags => tags)
    redirect to('/')
end   