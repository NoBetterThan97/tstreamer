# frozen_string_literal: true
require 'tweetstream'

Dir.glob("#{File.dirname(__FILE__)}/*.rb").each do |file|
  require file
end
