class AcompanhamentosController < ApplicationController
  before_action :set_acompanhamento, only: [:show, :edit, :update, :destroy]

  # GET /acompanhamentos
  # GET /acompanhamentos.json
  def index
    @acompanhamentos = Acompanhamento.all
  end

  # GET /acompanhamentos/1
  # GET /acompanhamentos/1.json
  def show
  end

  # GET /acompanhamentos/new
  def new
    @acompanhamento = Acompanhamento.new
  end

  # GET /acompanhamentos/1/edit
  def edit
  end

  # POST /acompanhamentos
  # POST /acompanhamentos.json
  def create
    @acompanhamento = Acompanhamento.new(acompanhamento_params)

    respond_to do |format|
      if @acompanhamento.save
        format.html { redirect_to @acompanhamento, notice: 'Acompanhamento was successfully created.' }
        format.json { render :show, status: :created, location: @acompanhamento }
      else
        format.html { render :new }
        format.json { render json: @acompanhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acompanhamentos/1
  # PATCH/PUT /acompanhamentos/1.json
  def update
    respond_to do |format|
      if @acompanhamento.update(acompanhamento_params)
        format.html { redirect_to @acompanhamento, notice: 'Acompanhamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @acompanhamento }
      else
        format.html { render :edit }
        format.json { render json: @acompanhamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acompanhamentos/1
  # DELETE /acompanhamentos/1.json
  def destroy
    @acompanhamento.destroy
    respond_to do |format|
      format.html { redirect_to acompanhamentos_url, notice: 'Acompanhamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acompanhamento
      @acompanhamento = Acompanhamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acompanhamento_params
      params.require(:acompanhamento).permit(:preco_acompanhamento, :nome_acompanhamento, :esta_ativo, :produto_id)
    end
end
