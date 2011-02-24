require 'test_helper'

class VinculosControllerTest < ActionController::TestCase
  setup do
    @vinculo = vinculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vinculo" do
    assert_difference('Vinculo.count') do
      post :create, :vinculo => @vinculo.attributes
    end

    assert_redirected_to vinculo_path(assigns(:vinculo))
  end

  test "should show vinculo" do
    get :show, :id => @vinculo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vinculo.to_param
    assert_response :success
  end

  test "should update vinculo" do
    put :update, :id => @vinculo.to_param, :vinculo => @vinculo.attributes
    assert_redirected_to vinculo_path(assigns(:vinculo))
  end

  test "should destroy vinculo" do
    assert_difference('Vinculo.count', -1) do
      delete :destroy, :id => @vinculo.to_param
    end

    assert_redirected_to vinculos_path
  end
end
