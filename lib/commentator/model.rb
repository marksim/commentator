module Commentator
  module Model
    def self.included(base)
      base.send :has_many, :comments, as: :commentable, class_name: 'Commentator::Comment'
    end
  end
end

