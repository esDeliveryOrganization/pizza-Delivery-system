require "application_system_test_case"

class LojasTest < ApplicationSystemTestCase
  setup do
    @loja = lojas(:one)
  end

  test "visiting the index" do
    visit lojas_url
    assert_selector "h1", text: "Lojas"
  end

  test "creating a Loja" do
    visit lojas_url
    click_on "New Loja"

    fill_in "Abertura", with: @loja.abertura
    fill_in "Fechamento", with: @loja.fechamento
    click_on "Create Loja"

    assert_text "Loja was successfully created"
    click_on "Back"
  end

  test "updating a Loja" do
    visit lojas_url
    click_on "Edit", match: :first

    fill_in "Abertura", with: @loja.abertura
    fill_in "Fechamento", with: @loja.fechamento
    click_on "Update Loja"

    assert_text "Loja was successfully updated"
    click_on "Back"
  end

  test "destroying a Loja" do
    visit lojas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loja was successfully destroyed"
  end
end
