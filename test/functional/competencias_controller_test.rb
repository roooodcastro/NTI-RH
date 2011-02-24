require 'test_helper'

class CompetenciasControllerTest < ActionController::TestCase
  setup do
    @competencia = competencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:competencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create competencia" do
    assert_difference('Competencia.count') do
      post :create, :competencia => @competencia.attributes
    end

    assert_redirected_to competencia_path(assigns(:competencia))
  end

  test "should show competencia" do
    get :show, :id => @competencia.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @competencia.to_param
    assert_response :success
  end

  test "should update competencia" do
    put :update, :id => @competencia.to_param, :competencia => @competencia.attributes
    assert_redirected_to competencia_path(assigns(:competencia))
  end

  test "should destroy competencia" do
    assert_difference('Competencia.count', -1) do
      delete :destroy, :id => @competencia.to_param
    end

    assert_redirected_to competencias_path
  end
end
