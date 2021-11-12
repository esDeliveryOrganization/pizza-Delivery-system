require "test_helper"

class CardapioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cardapio_index_url
    assert_response :success
  end
end
