class CalculatorCommand
  def action
    @action
  end

  def action=(a)
    @action = a
  end

  def calculate(a,b)
    @action.call(a,b)
  end

  def self.get_command(operator)
    case operator
    when "+"
      self.Add
    when "-"
      self.Subtract
    when "*"
      self.Multiply
    when "X"
      self.Multiply
    when "/"
      self.Divide
    else
      nil
    end
  end

  def self.Add()
    self.create_command lambda {|a,b| a + b }
  end

  def self.Subtract()
    self.create_command lambda {|a,b| a - b }
  end

  def self.Multiply()
    self.create_command lambda {|a,b| a * b }
  end

  def self.Divide()
    self.create_command lambda {|a,b| a / b }
  end

private

  def self.create_command(a)
    c = CalculatorCommand.new
    c.action = a
    c
  end

end
