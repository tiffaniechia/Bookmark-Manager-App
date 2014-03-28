post '/links' do 
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
      #this will either find the tag or create it if it doesnt exist
      Tag.first_or_create(:text => tag)
    # email = User.create(:email => @email_note)
    end

    Link.create(:url => url,
                :title => title, 
                :tags => tags,
                # :users => email
               )
    redirect to('/')
end   

get '/links/new' do 
  erb :"links/new"
end  