require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'rr'
require 'vidibus-gem_template'

Dir[File.expand_path('spec/support/**/*.rb')].each { |f| require f }

Mongoid.configure do |config|
  config.connect_to('vidibus-gem_template_test')
end

RSpec.configure do |config|
  config.mock_with :rr
  config.before(:each) do
    Mongoid::Sessions.default.collections.
      select { |c| c.name !~ /system/ }.each(&:drop)
  end
end
