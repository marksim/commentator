module Commentator
  class Engine < ::Rails::Engine
    isolate_namespace Commentator
    initializer 'commentator.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Commentator::CommentsHelper
      end
    end

  end
end
