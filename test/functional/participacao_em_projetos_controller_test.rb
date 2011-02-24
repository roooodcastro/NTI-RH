require 'test_helper'

class ParticipacaoEmProjetosControllerTest < ActionController::TestCase
  setup do
    @participacao_em_projeto = participacao_em_projetos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participacao_em_projetos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participacao_em_projeto" do
    assert_difference('ParticipacaoEmProjeto.count') do
      post :create, :participacao_em_projeto => @participacao_em_projeto.attributes
    end

    assert_redirected_to participacao_em_projeto_path(assigns(:participacao_em_projeto))
  end

  test "should show participacao_em_projeto" do
    get :show, :id => @participacao_em_projeto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participacao_em_projeto.to_param
    assert_response :success
  end

  test "should update participacao_em_projeto" do
    put :update, :id => @participacao_em_projeto.to_param, :participacao_em_projeto => @participacao_em_projeto.attributes
    assert_redirected_to participacao_em_projeto_path(assigns(:participacao_em_projeto))
  end

  test "should destroy participacao_em_projeto" do
    assert_difference('ParticipacaoEmProjeto.count', -1) do
      delete :destroy, :id => @participacao_em_projeto.to_param
    end

    assert_redirected_to participacao_em_projetos_path
  end
end
