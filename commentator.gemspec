$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "commentator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "commentator"
  s.version     = Commentator::VERSION
  s.authors     = ["Mark Simoneau"]
  s.email       = ["mark@quarternotecoda.com"]
  s.homepage    = "http://github.com/marksim/commentator"
  s.summary     = "Easily add comments to any model / page in your app with 2 lines of code"
  s.description = "Provides models, views and easy configuration for comments"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "coffee-script"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
