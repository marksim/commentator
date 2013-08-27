require_dependency "commentator/application_controller"

module Commentator
  class CommentsController < ApplicationController
    before_filter :comment
    before_filter :commentable
    before_filter Commentator.authorize_method

    def reply
      new_comment = Comment.new(parent_id: params[:id],
                                commentable: commentable)
      render partial: 'commentator/comments/form',
             locals: {
               comment: new_comment,
               commentable: commentable,
             },
             layout: false
    end

    def create
      comment.commentable = commentable
      comment.owner = send(Commentator.current_commenter_method)
      if comment.save
        render partial: 'commentator/comments/comment',
          locals: { comment: comment }, layout: false, status: :created
      else
        render partial: 'comments/form',
          layout: false, status: :unprocessable_entity
      end
    end

    def update
      if comment.update_attributes(params[:comment])
        render partial: 'commentator/comments/comment',
          locals: { comment: comment }, layout: false, status: :created
      else
        render partial: 'comments/form',
          layout: false, status: :unprocessable_entity
      end
    end

    def destroy
      comment.destroy
      render json: comment, status: :ok
    end

  private
    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end

    def comment
      @comment ||=
        (params[:id] ?
          Comment.find(params[:id]) :
          (params[:comment] ?
            Comment.new(comment_params) :
            Comment.new))
    end

    def commentable
      @commentable ||= comment.commentable
      @commentable ||=
        params[:comment][:commentable_type].constantize.
          find(params[:comment][:commentable_id])
    end

    def always_allow_comment
      true
    end
  end
end
