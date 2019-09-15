require "helper"
require "fluent/plugin/filter_json_string_parser.rb"

class JsonStringParserFilterTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::JsonStringParserFilter).configure(conf)
  end
end
