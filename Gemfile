# Edit this Gemfile to bundle your application's dependencies.

source 'http://rubygems.org'

# gem "rails", "3.1.0.beta1"
gem 'rails', :git => 'git://github.com/rails/rails.git'
# Asset template engines  
gem 'sass'  
gem 'coffee-script'  
gem 'uglifier'  
  
gem 'jquery-rails'

gem 'unicorn'

gem "socky-server", "~> 0.4.1" # this is a stand-alone server, is not part of the app and should not be here
gem "socky-client-rails", "~> 0.4.5" # this is the client used to connect the app to the server

# gem "postgres-pr"
gem "pg"

# gem "devise", "~>1.3.4"
gem "devise", :git => "git://github.com/plataformatec/devise.git"
gem "kaminari" #replacement for willpaginate

gem 'gravatarify', "~> 2.2.2"
# gem 'escape_utils' # this will fix an issue with Rack::Test 1.2.1 and ruby 1.9.2
gem 'dynamic_form'

group :test, :development do
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  # gem 'steak'
  gem "database_cleaner"
  gem 'rspec', :git => 'https://github.com/rspec/rspec.git'
  gem 'rspec-rails', :git => "https://github.com/rspec/rspec-rails.git"
  gem 'shoulda-matchers', :git => "git://github.com/thoughtbot/shoulda-matchers.git"
  gem "annotate-models", :require => false
  gem "miniskirt"
  gem 'launchy'
  gem 'simplecov', :require => false
  gem 'ruby-graphviz'
  # gem 'spork', '~> 0.9.0.rc'
  # guard stuff
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  # gem "guard-livereload", "~> 0.1.11" #has conflict, removing for now
  gem 'growl'
  gem 'hirb'
#  gem 'bullet' # for finding n+1
end
