require 'test_helper'

class DewormingsControllerTest < ActionController::TestCase
  setup do
    @deworming = dewormings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dewormings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deworming" do
    assert_difference('Deworming.count') do
      post :create, deworming: { name: @deworming.name, treatment_id: @deworming.treatment_id }
    end

    assert_redirected_to deworming_path(assigns(:deworming))
  end

  test "should show deworming" do
    get :show, id: @deworming
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deworming
    assert_response :success
  end

  test "should update deworming" do
    patch :update, id: @deworming, deworming: { name: @deworming.name, treatment_id: @deworming.treatment_id }
    assert_redirected_to deworming_path(assigns(:deworming))
  end

  test "should destroy deworming" do
    assert_difference('Deworming.count', -1) do
      delete :destroy, id: @deworming
    end

    assert_redirected_to dewormings_path
  end
end
