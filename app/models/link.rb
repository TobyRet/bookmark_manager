class Link

  include DataMapper::Resource # instances of this class are DataMapper resources

  has n, :tags, :through => Resource
  has n, :users, :through => Resource
  # the resources our model will have
  property :id, Serial
  property :title, String
  property :url, String
  has n, :users, :through => Resource

end