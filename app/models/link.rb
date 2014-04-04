class Link

  include DataMapper::Resource # instances of this class are DataMapper resources

  property :id, Serial
  property :title, String
  property :url, String

  has n, :tags, :through => Resource
  has 1, :user, :through => Resource
  
  #has n, :users, :through => Resource
  #attr_accessor :user

end