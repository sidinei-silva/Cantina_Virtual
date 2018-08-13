require "application_system_test_case"

class AcompanhamentosTest < ApplicationSystemTestCase
  setup do
    @acompanhamento = acompanhamentos(:one)
  end

  test "visiting the index" do
    visit acompanhamentos_url
    assert_selector "h1", text: "Acompanhamentos"
  end

  test "creating a Acompanhamento" do
    visit acompanhamentos_url
    click_on "New Acompanhamento"

    fill_in "Esta Ativo", with: @acompanhamento.esta_ativo
    fill_in "Nome Acompanhamento", with: @acompanhamento.nome_acompanhamento
    fill_in "Preco Acompanhamento", with: @acompanhamento.preco_acompanhamento
    fill_in "Produto", with: @acompanhamento.produto_id
    click_on "Create Acompanhamento"

    assert_text "Acompanhamento was successfully created"
    click_on "Back"
  end

  test "updating a Acompanhamento" do
    visit acompanhamentos_url
    click_on "Edit", match: :first

    fill_in "Esta Ativo", with: @acompanhamento.esta_ativo
    fill_in "Nome Acompanhamento", with: @acompanhamento.nome_acompanhamento
    fill_in "Preco Acompanhamento", with: @acompanhamento.preco_acompanhamento
    fill_in "Produto", with: @acompanhamento.produto_id
    click_on "Update Acompanhamento"

    assert_text "Acompanhamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Acompanhamento" do
    visit acompanhamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acompanhamento was successfully destroyed"
  end
end
