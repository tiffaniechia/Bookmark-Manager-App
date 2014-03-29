post '/links' do 
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end

    link = Link.new(:url => url, :title => title, :tags => tags)
    link.user = current_user 
    link.save
    
    redirect to('/')
end   

get '/links/new' do 
  erb :"links/new"
end  