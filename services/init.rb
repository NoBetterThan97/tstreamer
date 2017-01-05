# frozen_string_literal: true
require 'httparty'
require 'json'

Dir.glob("#{File.dirname(__FILE__)}/*.rb").each do |file|
  require file
end
