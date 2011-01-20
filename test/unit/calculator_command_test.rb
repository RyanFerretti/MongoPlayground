require 'test_helper'

class CalculatorCommandTest < ActiveSupport::TestCase

  test "get/set action" do
    c = CalculatorCommand.new
    c.action = lambda {|x,y| "#{x.upcase}#{y.downcase}" }
    assert_equal "Xy", c.calculate("x","Y")
  end

  test "action add should add" do
    c = CalculatorCommand.Add 
    assert_equal 5, c.calculate(2,3)
  end

  test "action subtract should subtract" do
    c = CalculatorCommand.Subtract
    assert_equal 7, c.calculate(10,3)
  end

  test "action multiply should multiply" do
    c = CalculatorCommand.Multiply
    assert_equal 21, c.calculate(7,3)
  end

  test "action divide should divide" do
    c = CalculatorCommand.Divide
    assert_equal 3, c.calculate(30,10)
  end

  test "chain operations" do
    c = CalculatorCommand.Add
    z = CalculatorCommand.Add
    assert_equal 11, c.calculate(3,z.calculate(5,3))
  end

  test "chain double operations" do
    a = CalculatorCommand.Add
    b = CalculatorCommand.Subtract
    c = CalculatorCommand.Multiply
    d = CalculatorCommand.Divide
    assert_equal 16, d.calculate(c.calculate(a.calculate(3,5),b.calculate(6,2)),2)
  end

  test "get addition by plus operator" do
    c = CalculatorCommand.get_command "+"
    assert_equal 5, c.calculate(2,3)
  end

  test "get addition by minus operator" do
    c = CalculatorCommand.get_command "-"
    assert_equal -1, c.calculate(2,3)
  end

  test "get addition by multiply operator" do
    c = CalculatorCommand.get_command "*"
    assert_equal 6, c.calculate(2,3)
  end

  test "get addition by divide operator" do
    c = CalculatorCommand.get_command "/"
    assert_equal 2, c.calculate(6,3)
  end
end
