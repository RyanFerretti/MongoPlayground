class LoanDetail
  include Mongoid::Document
  after_create :setup_fields

  field :loan_id, :type => Integer
  embeds_many :loan_fields
  accepts_nested_attributes_for :loan_fields, :allow_destroy => false
  # http://groups.google.com/group/mongoid/browse_thread/thread/7ae6ff7d990876c?fwc=1        for below, need specific error messages
  validates_associated :loan_fields 

  def setup_fields
    prototypes = FieldPrototype.all
    prototypes.each do |p|
      field = LoanField.new(:field_prototype => p)
      self.loan_fields << field
      field.save
    end
  end

  def loan
    Loan.find self.loan_id
  end

  def loan=(l)
    self.loan_id = l.id
  end
end
