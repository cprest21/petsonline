require 'test_helper'

class PetTreatmentsControllerTest < ActionController::TestCase
  setup do
    @pet_treatment = pet_treatments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_treatments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_treatment" do
    assert_difference('PetTreatment.count') do
      post :create, pet_treatment: { medical_history_no: @pet_treatment.medical_history_no, pet_id: @pet_treatment.pet_id, treatment_id: @pet_treatment.treatment_id }
    end

    assert_redirected_to pet_treatment_path(assigns(:pet_treatment))
  end

  test "should show pet_treatment" do
    get :show, id: @pet_treatment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_treatment
    assert_response :success
  end

  test "should update pet_treatment" do
    patch :update, id: @pet_treatment, pet_treatment: { medical_history_no: @pet_treatment.medical_history_no, pet_id: @pet_treatment.pet_id, treatment_id: @pet_treatment.treatment_id }
    assert_redirected_to pet_treatment_path(assigns(:pet_treatment))
  end

  test "should destroy pet_treatment" do
    assert_difference('PetTreatment.count', -1) do
      delete :destroy, id: @pet_treatment
    end

    assert_redirected_to pet_treatments_path
  end
end
