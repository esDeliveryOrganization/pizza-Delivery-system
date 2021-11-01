require "application_system_test_case"

class SaborsTest < ApplicationSystemTestCase
  setup do
    @sabor = sabors(:one)
  end

  test "visiting the index" do
    visit sabors_url
    assert_selector "h1", text: "Sabors"
  end

  test "creating a Sabor" do
    visit sabors_url
    click_on "New Sabor"

    fill_in "Nome", with: @sabor.nome
    fill_in "Preco", with: @sabor.preco
    click_on "Create Sabor"

    assert_text "Sabor was successfully created"
    click_on "Back"
  end

  test "updating a Sabor" do
    visit sabors_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @sabor.nome
    fill_in "Preco", with: @sabor.preco
    click_on "Update Sabor"

    assert_text "Sabor was successfully updated"
    click_on "Back"
  end

  test "destroying a Sabor" do
    visit sabors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sabor was successfully destroyed"
  end
end
