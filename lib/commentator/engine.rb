module Commentator
  class Engine < ::Rails::Engine
    isolate_namespace Commentator
    initializer 'commentator' do |app|
      ActiveSupport.on_load(:action_view) do
        require "commentator/comments_helper"
        class ActionView::Base
          include Commentator::CommentsHelper
        end
      end
    end

  end
end
