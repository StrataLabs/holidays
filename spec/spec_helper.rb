require 'rubygems'
require 'spork'

Spork.prefork do
  if( ENV['COVERAGE'] == 'on' )
    require 'simplecov'
    require 'simplecov-rcov'

    class SimpleCov::Formatter::MergedFormatter
      def format(result)
         SimpleCov::Formatter::HTMLFormatter.new.format(result)
         SimpleCov::Formatter::RcovFormatter.new.format(result)
      end
    end
    SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
    SimpleCov.start 'rails' do
      add_filter "/vendor/"
    end
  end

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/http'

  RSpec.configure do |config|
    config.mock_with :rspec
    config.before(:each) do
      Mongoid.master.collections.select { |c| c.name != 'system.indexes' }.each(&:drop)
    end
  end

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end

Spork.each_run do
end
