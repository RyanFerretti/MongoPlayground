require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  setup do
    @loan = Loan.create(:account_number => "123")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post :create, :loan => @loan.attributes
    end

    assert_redirected_to loan_detail_path(assigns(:loan).loan_detail)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete :destroy, :id => @loan.to_param
    end

    assert_redirected_to loans_path
  end
end
