# frozen_string_literal: true
require 'dotenv'

Dotenv.load

folders = 'services,workers'
Dir.glob("./{#{folders}}/init.rb").each do |file|
  require file
end
