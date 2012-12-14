require "bundler/setup"
require 'open-uri'
require "test/unit"
require 'vcr'
require 'webmock'


class SinatraTest < Test::Unit::TestCase

  def setup
	VCR.configure do |c|
	  	c.cassette_library_dir = File.expand_path(File.dirname(__FILE__) +'/vcr_cassettes')
	  	c.hook_into :webmock 
  	end
  end
 
  def test_hi
  	VCR.use_cassette("sinatra_test") do
  		assert_equal "Good bye, cruel World!", open("http://localhost:4567/hi").read
  	end
  end
 
end
