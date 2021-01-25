class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :like
end
