require 'rspec'
require 'guard/unicorn'

ENV["GUARD_ENV"] = 'test'

RSpec.configure do |config|
  config.color_enabled = true
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
