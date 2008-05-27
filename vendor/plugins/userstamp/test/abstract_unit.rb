require 'rubygems'
require 'test/unit'
require 'active_record'
require 'active_record/fixtures'
require 'active_support/test_case'
require 'logger'
require 'connection'

RAILS_ROOT = File.dirname(__FILE__)

$: << "../lib"

ActiveSupport::Deprecation.debug = true
ActiveRecord::Base.logger = Logger.new(STDOUT)

FIXTURE_PATH = File.dirname(__FILE__) + "/fixtures/"
class Test::Unit::TestCase
  self.fixture_path = FIXTURE_PATH
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures = true
end
