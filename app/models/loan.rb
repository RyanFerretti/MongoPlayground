class Loan < ActiveRecord::Base

  after_create :create_loan_detail
  before_destroy :destroy_loan_detail

  def create_loan_detail
    detail = LoanDetail.create(:loan => self)
    self.loan_detail = detail
    save
  end

  def destroy_loan_detail
    self.loan_detail.destroy
  end

  def loan_detail
    LoanDetail.find self.loan_detail_id
  end

  def loan_detail=(detail)
    self.loan_detail_id = detail.id.to_s
  end
end
