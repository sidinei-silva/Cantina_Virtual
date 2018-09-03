# frozen_string_literal: true
# Value for View
# Index
#   @produtos
#     {All values the produtos from session in database}
#   @acompanhamentos
#     {All values the acompanhamento from session in database}
#
class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!

  def index
    @pedido = Pedido.new
    @item_pedidos = @pedido.item_pedidos.build
    @item_pedidos.item_acompanhamentos.build
    unless params[:item].nil?
      items = Hash.new
      items[:produto_id] = params[:item][:produto_id]
      items[:acompanhamento_id] = params[:item][:acompanhamento_id]
      carrinho_insert << items
    end
    if defined? session[:carrinho].count
      capture_produtos
      capture_acompanhamentos
    end
  end

  def remove
    item_position = params[:item_position].to_i
    session[:recuperar_carrinho] = session[:carrinho].values_at(item_position)
    respond_to do |format|
      if session[:carrinho].delete_at(item_position)
        format.html { redirect_to carrinho_index_url, notice: "Item removido do carrinho", alert: "Deseja desfazer remoção?"}
      end
    end
  end

  def recuperar_carrinho
    respond_to do |format|
      if carrinho_insert << session[:recuperar_carrinho][0]
        format.html { redirect_to carrinho_index_url, notice: "Item recuperado do carrinho"}
      end
    end
  end
  private

  def carrinho_insert
    session[:carrinho] ||= []
  end

  def capture_produtos
    @produtos = []
    if defined? session[:carrinho].count
      session[:carrinho].each do |carrinho|
        # :nome (first request) "nome" (refresh)
        @produtos.push(Produto.find(carrinho[:produto_id]))
      rescue ActiveRecord::RecordNotFound
        @produtos.push(Produto.find(carrinho['produto_id']))
      end
    end
  end

  #@acompanhamentos_item_info
  #   {All values the acompanhamento from session in database }
  #@acompanhamento_info
  #   {-variable aux-Acompanhamento value separate}
  #acompanhamentos_all
  #   {All ids the acompanhemento in session separate in vector for item}
  def capture_acompanhamentos
    @acompanhamentos_item_info = []
    @acompanhamento_info = []
    acompanhamentos_all = []
    acompanhamentos_in_session(acompanhamentos_all)
    acompanhamentos_info(acompanhamentos_all)
  end

  def acompanhamentos_in_session(acompanhamentos_all)
    session[:carrinho].each do |carrinho|
      # :nome (first request) "nome" (refresh)
      if !carrinho[:acompanhamento_id].nil?
        acompanhamentos_all.push carrinho[:acompanhamento_id]
      else
        acompanhamentos_all.push carrinho['acompanhamento_id']
      end
    end
  end

  def acompanhamentos_info(acompanhamentos_all)
    acompanhamentos_all.each do |acompanhamento_item|
      acompanhamento_item.each do |acompanhamento_id|
        unless acompanhamento_id.blank?
          @acompanhamento_info.push(Acompanhamento.find(acompanhamento_id))
        end
      end
      @acompanhamentos_item_info.push(@acompanhamento_info)
      @acompanhamento_info = []
    end
  end

end

