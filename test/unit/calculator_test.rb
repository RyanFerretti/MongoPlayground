require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "can parse addition" do
    assert_equal 11, Calculator.go("5 + 6")
  end
end
