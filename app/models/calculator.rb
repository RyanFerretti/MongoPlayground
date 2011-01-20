class Calculator

  def self.go(calc_str)
    if calc_str.match('\d')
      split_calc_str = calc_str.split " "
      c = CalculatorCommand.get_command split_calc_str[1]
      c.calculate split_calc_str[0].to_i,split_calc_str[2].to_i
    end
  end

end
