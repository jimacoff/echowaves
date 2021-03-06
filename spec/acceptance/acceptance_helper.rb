require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'capybara/rails'
require 'capybara/rspec'

# module Steak::Capybara
#   include Rack::Test::Methods
#   include Capybara
#
#   def app
#     ::Rails.application
#   end
# end
# Capybara.current_driver = :selenium
Capybara.server_boot_timeout = 50
# RSpec.configuration.include Steak::Capybara, :type => :acceptance
RSpec.configuration.include Rails.application.routes.url_helpers, :type => :acceptance

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

include HelperMethods
