class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
    @pedidos_cliente = pedidos_cliente
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @nomes_acompanhamentos = "teste"
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @item_pedidos = @pedido.item_pedidos.build
    @item_pedidos.item_acompanhamentos.build
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        session[:carrinho] = nil
        format.html { redirect_to @pedido, notice: 'Pedido criado com sucesso.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to admin_root_path, notice: 'Pedido atualizado com sucesso.'}
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { redirect_to admin_root_path, notice: 'Não foi possivel atualizar o pedido.'}
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def pedidos_cliente
    @pedidos_cliente = Pedido.all.where(cliente_id: current_cliente)
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pedido_params
    params.require(:pedido).permit(
      :status_pedido,
      :total_pedido,
      :motivo_cancelamento,
      :cliente_id,
      item_pedidos_attributes:
      [
        #:quantidade_item_pedido,
        :total_item_pedido,
        :produto_id,
        item_acompanhamentos_attributes: [:preco_item_acompanhamento, :acompanhamento_id]
      ]
    )
  end
end
