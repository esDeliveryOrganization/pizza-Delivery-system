require "test_helper"

class SaborsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sabor = sabors(:one)
  end

  test "should get index" do
    get sabors_url
    assert_response :success
  end

  test "should get new" do
    get new_sabor_url
    assert_response :success
  end

  test "should create sabor" do
    assert_difference('Sabor.count') do
      post sabors_url, params: { sabor: { nome: @sabor.nome, preco: @sabor.preco } }
    end

    assert_redirected_to sabor_url(Sabor.last)
  end

  test "should show sabor" do
    get sabor_url(@sabor)
    assert_response :success
  end

  test "should get edit" do
    get edit_sabor_url(@sabor)
    assert_response :success
  end

  test "should update sabor" do
    patch sabor_url(@sabor), params: { sabor: { nome: @sabor.nome, preco: @sabor.preco } }
    assert_redirected_to sabor_url(@sabor)
  end

  test "should destroy sabor" do
    assert_difference('Sabor.count', -1) do
      delete sabor_url(@sabor)
    end

    assert_redirected_to sabors_url
  end
end
