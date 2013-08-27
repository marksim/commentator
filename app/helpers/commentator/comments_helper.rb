module Commentator
  module CommentsHelper
    def commentator_current_user
      send Commentator.current_commenter_method
    end

    def comments_for(commentable, options={})
      comments = Comment.where(commentable_type: commentable.class,
                               commentable_id: commentable.id,
                               parent_id: nil)
      render 'commentator/comments/comments',
             commentable: commentable, comments: comments
    end
  end
end
