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

```javascript 
# in application.js 
//= require commentator/comments
```

```ruby
# in application_controller.rb
helper Commentator::CommentsHelper

def authorize_comment
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

## Documentation

see wiki
