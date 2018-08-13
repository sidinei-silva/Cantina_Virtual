require 'test_helper'

class AcompanhamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acompanhamento = acompanhamentos(:one)
  end

  test "should get index" do
    get acompanhamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_acompanhamento_url
    assert_response :success
  end

  test "should create acompanhamento" do
    assert_difference('Acompanhamento.count') do
      post acompanhamentos_url, params: { acompanhamento: { esta_ativo: @acompanhamento.esta_ativo, nome_acompanhamento: @acompanhamento.nome_acompanhamento, preco_acompanhamento: @acompanhamento.preco_acompanhamento, produto_id: @acompanhamento.produto_id } }
    end

    assert_redirected_to acompanhamento_url(Acompanhamento.last)
  end

  test "should show acompanhamento" do
    get acompanhamento_url(@acompanhamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_acompanhamento_url(@acompanhamento)
    assert_response :success
  end

  test "should update acompanhamento" do
    patch acompanhamento_url(@acompanhamento), params: { acompanhamento: { esta_ativo: @acompanhamento.esta_ativo, nome_acompanhamento: @acompanhamento.nome_acompanhamento, preco_acompanhamento: @acompanhamento.preco_acompanhamento, produto_id: @acompanhamento.produto_id } }
    assert_redirected_to acompanhamento_url(@acompanhamento)
  end

  test "should destroy acompanhamento" do
    assert_difference('Acompanhamento.count', -1) do
      delete acompanhamento_url(@acompanhamento)
    end

    assert_redirected_to acompanhamentos_url
  end
end
