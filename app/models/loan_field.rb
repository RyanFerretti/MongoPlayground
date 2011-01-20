class LoanField
  include Mongoid::Document

  validates_numericality_of :value, :if => :is_number?
  validate :validates_date_type, :if => :is_date?
  validates_format_of :value, :with => /\d+\/\d+\/\d{4}/, :if => :is_date?, :message => "^Date must be in the following format: mm/dd/yyyy"

  embedded_in :loan_detail, :inverse_of => :loan_fields
  referenced_in :field_prototype

  field :value, :type => String


  def value
    if self.field_prototype.field_type == "Calculation"
      c1 = self.field_prototype[:calc_values][0]
      c2 = self.field_prototype[:calc_values][2]
      op = self.field_prototype[:calc_values][1]
      v1 = self.loan_detail.loan_fields.where(:field_prototype_id => c1)
      v2 = self.loan_detail.loan_fields.where(:field_prototype_id => c2)
      Calculator.go("#{v1.first.value} #{op} #{v2.first.value}")
    else
      read_attribute(:value)
    end
  end

  def is_number?
    is_type?("BigDecimal")
  end

  def is_date?
    is_type?("Date")
  end

  def validates_date_type
    Date.parse(self.value)
  rescue ArgumentError
    errors.add("Specified date", "is invalid. Please use the format mm/dd/yyyy")
  end

private

  def is_type?(t)
    if self.value.blank? 
      false
    elsif self.field_prototype.napable && self.value == "NAP"
      false
    elsif self.field_prototype.navable && self.value == "NAV"
      false
    else
      self.field_prototype.field_type == t
    end
  end

end
