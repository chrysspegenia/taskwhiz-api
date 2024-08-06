class BoardSerializer
  include JSONAPI::Serializer
  attributes :title
  has_many :tasks
end
