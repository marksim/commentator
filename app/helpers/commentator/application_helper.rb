module Commentator
  module ApplicationHelper
    def slugify(string)
      ret = string.strip.downcase

      #blow away apostrophes
      ret.gsub!(/['`]/, "")

      # @ --> at, and & --> and
      ret.gsub!(/\s*@\s*/, " at ")
      ret.gsub!(/\s*&\s*/, " and ")

      #replace all non alphanumeric, dash with dash
      ret.gsub!(/\s*[^A-Za-z0-9\-]\s*/, '-')

      #convert double underscores to single
      ret.gsub!(/\-+/, "-")

      #strip off leading/trailing underscore
      ret.gsub!(/\A[-\.]+|[-\.]+\z/, "")

      ret
    end
  end
end
