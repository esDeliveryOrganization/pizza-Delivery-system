require "test_helper"

class MenuClienteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menu_cliente_index_url
    assert_response :success
  end
end
