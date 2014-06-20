require 'test_helper'

class PetsLossesControllerTest < ActionController::TestCase
  setup do
    @pets_loss = pets_losses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets_losses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pets_loss" do
    assert_difference('PetsLoss.count') do
      post :create, pets_loss: { loss_history_no: @pets_loss.loss_history_no, loss_id: @pets_loss.loss_id, pet_id: @pets_loss.pet_id }
    end

    assert_redirected_to pets_loss_path(assigns(:pets_loss))
  end

  test "should show pets_loss" do
    get :show, id: @pets_loss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pets_loss
    assert_response :success
  end

  test "should update pets_loss" do
    patch :update, id: @pets_loss, pets_loss: { loss_history_no: @pets_loss.loss_history_no, loss_id: @pets_loss.loss_id, pet_id: @pets_loss.pet_id }
    assert_redirected_to pets_loss_path(assigns(:pets_loss))
  end

  test "should destroy pets_loss" do
    assert_difference('PetsLoss.count', -1) do
      delete :destroy, id: @pets_loss
    end

    assert_redirected_to pets_losses_path
  end
end
