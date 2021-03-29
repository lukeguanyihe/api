class ArticleSerializer
  include JSONAPI::Serializer
  #set_type :articles #override the default to be plural
  attributes :title, :content, :slug
end
