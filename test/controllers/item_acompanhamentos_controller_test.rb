require 'test_helper'

class ItemAcompanhamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_acompanhamento = item_acompanhamentos(:one)
  end

  test "should get index" do
    get item_acompanhamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_item_acompanhamento_url
    assert_response :success
  end

  test "should create item_acompanhamento" do
    assert_difference('ItemAcompanhamento.count') do
      post item_acompanhamentos_url, params: { item_acompanhamento: { acompanhamento_id: @item_acompanhamento.acompanhamento_id, item_pedido_id: @item_acompanhamento.item_pedido_id, preco_item_acompanhamento: @item_acompanhamento.preco_item_acompanhamento } }
    end

    assert_redirected_to item_acompanhamento_url(ItemAcompanhamento.last)
  end

  test "should show item_acompanhamento" do
    get item_acompanhamento_url(@item_acompanhamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_acompanhamento_url(@item_acompanhamento)
    assert_response :success
  end

  test "should update item_acompanhamento" do
    patch item_acompanhamento_url(@item_acompanhamento), params: { item_acompanhamento: { acompanhamento_id: @item_acompanhamento.acompanhamento_id, item_pedido_id: @item_acompanhamento.item_pedido_id, preco_item_acompanhamento: @item_acompanhamento.preco_item_acompanhamento } }
    assert_redirected_to item_acompanhamento_url(@item_acompanhamento)
  end

  test "should destroy item_acompanhamento" do
    assert_difference('ItemAcompanhamento.count', -1) do
      delete item_acompanhamento_url(@item_acompanhamento)
    end

    assert_redirected_to item_acompanhamentos_url
  end
end
