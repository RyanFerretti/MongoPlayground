class FieldPrototype
  include Mongoid::Document
  after_create :add_loan_field_to_all
  before_destroy :remove_loan_field_from_all

  references_many :loan_fields # this doesn't seem to be working  :(

  field :name, :type => String
  field :description, :type => String
  field :field_type, :type => String
  field :segment, :type => String
  field :readonly, :type => Boolean
  field :navable, :type => Boolean
  field :napable, :type => Boolean  

  def field_type=(t)
    if t == "Calculation"
      self.readonly = true
    end
    write_attribute(:field_type,t)
  end

  def add_loan_field_to_all
    details = LoanDetail.all
    details.each do |detail|
      field = LoanField.new(:field_prototype => self)
      detail.loan_fields << field
      self.loan_fields << field
      field.save
    end
    save
  end

  def remove_loan_field_from_all
    # hack shouldn't have to do this but association not working
    details = LoanDetail.all
    details.each do |d|
      d.loan_fields.each do |f|
        if f.field_prototype_id == self.id
          f.delete
        end
      end
    end
  end
end