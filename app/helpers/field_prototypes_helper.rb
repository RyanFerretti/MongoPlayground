module FieldPrototypesHelper
  def field_types
    {"Text" => String.to_s, "Decimal" => BigDecimal.to_s, "True/False" => Boolean.to_s, "Drop Down" => "DropDown", "Calculation" => "Calculation"}
  end

  def segments
    ["Summary","Borrower","Note"]
  end

  def dd_text_field_values(index)
    if @field_prototype[:dd_values]
      @field_prototype[:dd_values][index]
    end
  end

  def calc_select_values(index)
    if @field_prototype[:calc_values]
      @field_prototype[:calc_values][index]
    end
  end

  def all_prototype_number_fields
    @field_prototypes.reject{|i|i.field_type != "BigDecimal"} 
  end

  def operands
    ["+","-","X","/"]
  end
end
