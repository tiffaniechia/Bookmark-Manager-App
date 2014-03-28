get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @tag_list = Tag.all
  @links = tag ? tag.links : []
  erb :index
end