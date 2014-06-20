require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { apartment_no: @address.apartment_no, building: @address.building, city_id: @address.city_id, floor: @address.floor, office_no: @address.office_no, street: @address.street, street_no: @address.street_no, telephone: @address.telephone }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { apartment_no: @address.apartment_no, building: @address.building, city_id: @address.city_id, floor: @address.floor, office_no: @address.office_no, street: @address.street, street_no: @address.street_no, telephone: @address.telephone }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
