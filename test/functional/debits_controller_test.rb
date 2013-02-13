require 'test_helper'

class DebitsControllerTest < ActionController::TestCase
  setup do
    @debit = debits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debit" do
    assert_difference('Debit.count') do
      post :create, debit: { Betrag: @debit.Betrag, Datum: @debit.Datum, Info: @debit.Info, Nachname: @debit.Nachname, Vorname: @debit.Vorname }
    end

    assert_redirected_to debit_path(assigns(:debit))
  end

  test "should show debit" do
    get :show, id: @debit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debit
    assert_response :success
  end

  test "should update debit" do
    put :update, id: @debit, debit: { Betrag: @debit.Betrag, Datum: @debit.Datum, Info: @debit.Info, Nachname: @debit.Nachname, Vorname: @debit.Vorname }
    assert_redirected_to debit_path(assigns(:debit))
  end

  test "should destroy debit" do
    assert_difference('Debit.count', -1) do
      delete :destroy, id: @debit
    end

    assert_redirected_to debits_path
  end
end
