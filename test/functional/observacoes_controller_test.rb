require 'test_helper'

class ObservacoesControllerTest < ActionController::TestCase
  setup do
    @observacao = observacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observacao" do
    assert_difference('Observacao.count') do
      post :create, :observacao => @observacao.attributes
    end

    assert_redirected_to observacao_path(assigns(:observacao))
  end

  test "should show observacao" do
    get :show, :id => @observacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @observacao.to_param
    assert_response :success
  end

  test "should update observacao" do
    put :update, :id => @observacao.to_param, :observacao => @observacao.attributes
    assert_redirected_to observacao_path(assigns(:observacao))
  end

  test "should destroy observacao" do
    assert_difference('Observacao.count', -1) do
      delete :destroy, :id => @observacao.to_param
    end

    assert_redirected_to observacoes_path
  end
end
