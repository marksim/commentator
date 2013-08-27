$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "commentator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "commentator"
  s.version     = Commentator::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Commentator."
  s.description = "TODO: Description of Commentator."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
