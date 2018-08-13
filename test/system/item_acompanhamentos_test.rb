require "application_system_test_case"

class ItemAcompanhamentosTest < ApplicationSystemTestCase
  setup do
    @item_acompanhamento = item_acompanhamentos(:one)
  end

  test "visiting the index" do
    visit item_acompanhamentos_url
    assert_selector "h1", text: "Item Acompanhamentos"
  end

  test "creating a Item acompanhamento" do
    visit item_acompanhamentos_url
    click_on "New Item Acompanhamento"

    fill_in "Acompanhamento", with: @item_acompanhamento.acompanhamento_id
    fill_in "Item Pedido", with: @item_acompanhamento.item_pedido_id
    fill_in "Preco Item Acompanhamento", with: @item_acompanhamento.preco_item_acompanhamento
    click_on "Create Item acompanhamento"

    assert_text "Item acompanhamento was successfully created"
    click_on "Back"
  end

  test "updating a Item acompanhamento" do
    visit item_acompanhamentos_url
    click_on "Edit", match: :first

    fill_in "Acompanhamento", with: @item_acompanhamento.acompanhamento_id
    fill_in "Item Pedido", with: @item_acompanhamento.item_pedido_id
    fill_in "Preco Item Acompanhamento", with: @item_acompanhamento.preco_item_acompanhamento
    click_on "Update Item acompanhamento"

    assert_text "Item acompanhamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Item acompanhamento" do
    visit item_acompanhamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item acompanhamento was successfully destroyed"
  end
end
