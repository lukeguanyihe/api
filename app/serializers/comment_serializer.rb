class CommentSerializer < ActiveModel::Serializer
  attributes :id, :context
  has_one :article
  has_one :user
end
