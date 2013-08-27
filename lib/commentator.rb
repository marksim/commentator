require "commentator/engine"
require "commentator/model"

module Commentator
  mattr_accessor :owner_class
  @@owner_class = "User"

  mattr_accessor :authorize_method
  @@authorize_method = :always_allow_comment

  mattr_accessor :current_commenter_method
  @@current_commenter_method = :current_user
end
