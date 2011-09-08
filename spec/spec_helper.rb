require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.before(:each) do
      ObjectSpace.each_object(Class) { |x| x.destroy_all if x.included_modules.include?(Mongoid::Document) }
    end
  end
end

Spork.each_run do
end
