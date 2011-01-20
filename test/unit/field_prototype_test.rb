require 'test_helper'

class FieldPrototypeTest < ActiveSupport::TestCase

  test "created prototype should get added to detail" do
    puts "starting"
    prototype = FieldPrototype.create(:name => "ahh")
    loan = Loan.create :account_number => "123"
    detail = loan.loan_detail
    assert_equal detail.loan_fields.count, 1
    FieldPrototype.create(:name => "nooo")
    assert_equal detail.loan_fields.count, 2
  end

  test "destroyed prototype should get removed from detail" do
    loan = Loan.create :account_number => "123"
    detail = loan.loan_detail
    prototype = FieldPrototype.create(:name => "ahh")

    assert_equal detail.loan_fields.count, 1
    p = FieldPrototype.create(:name => "nooo")
    assert_equal detail.loan_fields.count, 2
    p.destroy
    assert_equal detail.loan_fields.count, 1
  end
end
