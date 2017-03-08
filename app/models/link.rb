class Link

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
  property :time, DateTime

  has n, :tags, :through => Resource

end
