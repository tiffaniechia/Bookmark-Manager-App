get '/' do 
  @links = Link.all
  @tag_list = Tag.all
  erb :index 
end 