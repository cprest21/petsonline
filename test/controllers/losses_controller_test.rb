require 'test_helper'

class LossesControllerTest < ActionController::TestCase
  setup do
    @loss = losses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:losses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loss" do
    assert_difference('Loss.count') do
      post :create, loss: { date_found: @loss.date_found, date_lost: @loss.date_lost, finder_contact_details: @loss.finder_contact_details, finder_name: @loss.finder_name, lost: @loss.lost, place_found: @loss.place_found, place_lost: @loss.place_lost }
    end

    assert_redirected_to loss_path(assigns(:loss))
  end

  test "should show loss" do
    get :show, id: @loss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loss
    assert_response :success
  end

  test "should update loss" do
    patch :update, id: @loss, loss: { date_found: @loss.date_found, date_lost: @loss.date_lost, finder_contact_details: @loss.finder_contact_details, finder_name: @loss.finder_name, lost: @loss.lost, place_found: @loss.place_found, place_lost: @loss.place_lost }
    assert_redirected_to loss_path(assigns(:loss))
  end

  test "should destroy loss" do
    assert_difference('Loss.count', -1) do
      delete :destroy, id: @loss
    end

    assert_redirected_to losses_path
  end
end
