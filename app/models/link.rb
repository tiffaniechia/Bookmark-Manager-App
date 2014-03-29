class Link 

  include DataMapper::Resource

  property :id, Serial 
  property :title, String
  property :url,  String    
  property :created_at, Date

  has n, :tags, :through => Resource
  has 1, :user, :through => Resource

end  

