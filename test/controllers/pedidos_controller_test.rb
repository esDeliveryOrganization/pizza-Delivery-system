require "test_helper"

class PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: { pedido: { contato: @pedido.contato, endereco_id: @pedido.endereco_id, entregador_id: @pedido.entregador_id, nomeDest: @pedido.nomeDest, obs: @pedido.obs, pizza_id: @pedido.pizza_id, precoTotal: @pedido.precoTotal, qtdPizzas: @pedido.qtdPizzas, status: @pedido.status } }
    end

    assert_redirected_to pedido_url(Pedido.last)
  end

  test "should show pedido" do
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: { pedido: { contato: @pedido.contato, endereco_id: @pedido.endereco_id, entregador_id: @pedido.entregador_id, nomeDest: @pedido.nomeDest, obs: @pedido.obs, pizza_id: @pedido.pizza_id, precoTotal: @pedido.precoTotal, qtdPizzas: @pedido.qtdPizzas, status: @pedido.status } }
    assert_redirected_to pedido_url(@pedido)
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete pedido_url(@pedido)
    end

    assert_redirected_to pedidos_url
  end
end
