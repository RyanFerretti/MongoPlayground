require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "loan detail created on create" do
    loan = Loan.create(:account_number => "123")
    assert !loan.loan_detail.nil?
  end

  test "loan detail can be set" do
    loan = Loan.create(:account_number => "123")
    new_detail = LoanDetail.create()
    assert loan.loan_detail != new_detail
    loan.loan_detail = new_detail
    assert loan.loan_detail == new_detail
  end

  test "destroy loan also destroys details" do
    loan = Loan.create(:account_number => "123")
    assert_equal Loan.all.count,3
    assert_equal LoanDetail.all.count,1
    loan.destroy
    assert_equal Loan.all.count,2
    assert_equal LoanDetail.all.count,0
  end
end
