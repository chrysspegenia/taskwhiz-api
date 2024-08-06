class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :priority, :is_complete, :tags
end
