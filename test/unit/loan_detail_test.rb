require 'test_helper'

class LoanDetailTest < ActiveSupport::TestCase

  test "create_fields_on_create" do
    1.upto 3 do
      FieldPrototype.create(:name => "n")
    end
    detail = LoanDetail.create
    assert_equal detail.loan_fields.count, 3 
  end

end
