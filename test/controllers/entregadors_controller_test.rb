require "test_helper"

class EntregadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entregador = entregadors(:one)
  end

  test "should get index" do
    get entregadors_url
    assert_response :success
  end

  test "should get new" do
    get new_entregador_url
    assert_response :success
  end

  test "should create entregador" do
    assert_difference('Entregador.count') do
      post entregadors_url, params: { entregador: { cpf: @entregador.cpf, nome: @entregador.nome, telefone: @entregador.telefone } }
    end

    assert_redirected_to entregador_url(Entregador.last)
  end

  test "should show entregador" do
    get entregador_url(@entregador)
    assert_response :success
  end

  test "should get edit" do
    get edit_entregador_url(@entregador)
    assert_response :success
  end

  test "should update entregador" do
    patch entregador_url(@entregador), params: { entregador: { cpf: @entregador.cpf, nome: @entregador.nome, telefone: @entregador.telefone } }
    assert_redirected_to entregador_url(@entregador)
  end

  test "should destroy entregador" do
    assert_difference('Entregador.count', -1) do
      delete entregador_url(@entregador)
    end

    assert_redirected_to entregadors_url
  end
end
