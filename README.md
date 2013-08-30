# Commentator

Commentator is a Rails Engine for adding commenting to any page/model in your app.

## Installation

Install the gem

``` sh
gem install commentator
```

Or in your Gemfile

``` sh
gem 'commentator'
```

## Configuration

```sh
rake commentator # Installs the DB Migration
```

```ruby
# in config/routes.rb
mount Commentator::Engine => "/commentator"
```

```javascript 
# in application.js 
//= require commentator/comments
```

```ruby
# in application_controller.rb
def authorize_comment
  # you have access to @commentable
  true # Your logic here
end
```

```ruby 
# in config/initializer.rb
Commentator.configure do |config|
  # config.owner_class = "User"
  # config.current_commenter_method = :current_user
  config.authorize_method = :authorize_comment
end
```

## Usage

``` ruby
# In any model
class MyModel < ActiveRecord::Base
  include Commentator::Model
end

my_model.comments
```

``` erb
# in any view
# @my_model.class_name + @my_model.id is the key for which comments to look up
<%= comments_for(@my_model) %>

# Not working yet - for comments not tied to a model, but tied to a page
# :about_us is the key for which comments to look up
<%= comments_for(:about_us) %>
```

## Examples

In Views

``` 
# No new comments or replies
= comments_for(@my_model, :read_only => true)

# Replies to existing comments only
= comments_for(@my_model, :replies_only => true)

# No Nested Comments
= comments_for(@my_model, :no_replies => true)
```

In code
```
# if Commentator::Model is included in the model, you get
my_model.comments
```
