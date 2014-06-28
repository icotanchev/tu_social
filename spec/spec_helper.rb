require 'rubygems'
require 'spork'

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'database_cleaner'
  require 'capybara/rspec'
  # require 'webmock/rspec'
  require 'capybara/poltergeist'
  require 'factory_girl_rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  Dir[Rails.root.join('spec/shared_examples/**/*.rb')].sort.each { |f| require f }

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    # Enable only the new expect syntax
    config.expect_with :rspec do |c|
      c.syntax = :expect
    end

    # Use described class when defining anonymous controllers
    config.infer_base_class_for_anonymous_controllers = true

    # Filters
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus
    config.filter_run_excluding :broken

    # DatabaseCleaner
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with :truncation
    end

    config.before(:each, type: :feature) do
      DatabaseCleaner.strategy = :truncation, { pre_count: true }
    end
    
    config.before(:each) do
      DatabaseCleaner.start
    end
    
    config.after(:each) do
      DatabaseCleaner.clean
    end

    # PaperTrail
    config.before(:each, versioning: true) do
      PaperTrail.enabled = true
    end

    # Include factory_girl's syntax to simplify factories calls
    config.include FactoryGirl::Syntax::Methods

    # Devise
    config.include Devise::TestHelpers, type: :controller

    # Use Poltergeist driver in Capybara when js: true
    Capybara.javascript_driver = :poltergeist

    # Redis
    # Resque.redis = MockRedis.new
    # Resque.inline = true

    # WebMock
    # config.before(:each, type: :feature, js: true) do
    #   WebMock.disable_net_connect!(allow_localhost: true)
    # end

    # config.after(:each, type: :feature, js: true) do
    #   WebMock.disable_net_connect!
    # end

    config.include Capybara::DSL
  end
end

Spork.each_run do
  TuSocial::Application.reload_routes!

  # FactoryGirl
  FactoryGirl.reload
end