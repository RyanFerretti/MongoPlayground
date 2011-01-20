ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  teardown :clean
  def clean
    puts "cleaning loans"
    Loan.delete_all
    puts "cleaning mongodb...."
    Mongoid.database.collections.each do |collection|
      unless collection.name =~ /^system\./
        collection.remove
      end
    end
    puts "finished cleaning mongodb."
  end
end
