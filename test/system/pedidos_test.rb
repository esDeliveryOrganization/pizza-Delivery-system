require "application_system_test_case"

class PedidosTest < ApplicationSystemTestCase
  setup do
    @pedido = pedidos(:one)
  end

  test "visiting the index" do
    visit pedidos_url
    assert_selector "h1", text: "Pedidos"
  end

  test "creating a Pedido" do
    visit pedidos_url
    click_on "New Pedido"

    fill_in "Contato", with: @pedido.contato
    fill_in "Endereco", with: @pedido.endereco_id
    fill_in "Entregador", with: @pedido.entregador_id
    fill_in "Nomedest", with: @pedido.nomeDest
    fill_in "Obs", with: @pedido.obs
    fill_in "Pizza", with: @pedido.pizza_id
    fill_in "Precototal", with: @pedido.precoTotal
    fill_in "Qtdpizzas", with: @pedido.qtdPizzas
    fill_in "Status", with: @pedido.status
    click_on "Create Pedido"

    assert_text "Pedido was successfully created"
    click_on "Back"
  end

  test "updating a Pedido" do
    visit pedidos_url
    click_on "Edit", match: :first

    fill_in "Contato", with: @pedido.contato
    fill_in "Endereco", with: @pedido.endereco_id
    fill_in "Entregador", with: @pedido.entregador_id
    fill_in "Nomedest", with: @pedido.nomeDest
    fill_in "Obs", with: @pedido.obs
    fill_in "Pizza", with: @pedido.pizza_id
    fill_in "Precototal", with: @pedido.precoTotal
    fill_in "Qtdpizzas", with: @pedido.qtdPizzas
    fill_in "Status", with: @pedido.status
    click_on "Update Pedido"

    assert_text "Pedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Pedido" do
    visit pedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pedido was successfully destroyed"
  end
end
