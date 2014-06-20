require 'test_helper'

class VaccinationTypesControllerTest < ActionController::TestCase
  setup do
    @vaccination_type = vaccination_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaccination_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaccination_type" do
    assert_difference('VaccinationType.count') do
      post :create, vaccination_type: { name: @vaccination_type.name, treatment_id: @vaccination_type.treatment_id }
    end

    assert_redirected_to vaccination_type_path(assigns(:vaccination_type))
  end

  test "should show vaccination_type" do
    get :show, id: @vaccination_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vaccination_type
    assert_response :success
  end

  test "should update vaccination_type" do
    patch :update, id: @vaccination_type, vaccination_type: { name: @vaccination_type.name, treatment_id: @vaccination_type.treatment_id }
    assert_redirected_to vaccination_type_path(assigns(:vaccination_type))
  end

  test "should destroy vaccination_type" do
    assert_difference('VaccinationType.count', -1) do
      delete :destroy, id: @vaccination_type
    end

    assert_redirected_to vaccination_types_path
  end
end
