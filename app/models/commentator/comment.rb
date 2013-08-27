module Commentator
  class Comment < ActiveRecord::Base
    belongs_to :commentable, polymorphic: true
    belongs_to :owner, class_name: Commentator.owner_class
    belongs_to :parent, class_name: 'Comment'

    has_many :replies, foreign_key: :parent_id,
      class_name: 'Comment', dependent: :destroy

    default_scope order(:created_at)

    scope :base, where(parent_id: nil)
  end
end
