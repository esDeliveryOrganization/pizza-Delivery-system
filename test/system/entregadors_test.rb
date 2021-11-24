require "application_system_test_case"

class EntregadorsTest < ApplicationSystemTestCase
  setup do
    @entregador = entregadors(:one)
  end

  test "visiting the index" do
    visit entregadors_url
    assert_selector "h1", text: "Entregadors"
  end

  test "creating a Entregador" do
    visit entregadors_url
    click_on "New Entregador"

    fill_in "Cpf", with: @entregador.cpf
    fill_in "Nome", with: @entregador.nome
    fill_in "Telefone", with: @entregador.telefone
    click_on "Create Entregador"

    assert_text "Entregador was successfully created"
    click_on "Back"
  end

  test "updating a Entregador" do
    visit entregadors_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @entregador.cpf
    fill_in "Nome", with: @entregador.nome
    fill_in "Telefone", with: @entregador.telefone
    click_on "Update Entregador"

    assert_text "Entregador was successfully updated"
    click_on "Back"
  end

  test "destroying a Entregador" do
    visit entregadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entregador was successfully destroyed"
  end
end
