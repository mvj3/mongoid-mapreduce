require "rubygems"
require "bundler/setup"

require "rspec"

require File.expand_path("../../lib/mongoid/mapreduce", __FILE__)
require 'mongo'

Mongoid.connect_to "mongoid-mapreduce-test"

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.before :each do
    Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
