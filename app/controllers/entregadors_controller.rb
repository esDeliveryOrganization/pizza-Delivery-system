class EntregadorsController < ApplicationController
  before_action :set_entregador, only: %i[ show edit update destroy ]

  # GET /entregadors or /entregadors.json
  def index
    @entregadors = Entregador.all
  end

  # GET /entregadors/1 or /entregadors/1.json
  def show
  end

  # GET /entregadors/new
  def new
    @entregador = Entregador.new
  end

  # GET /entregadors/1/edit
  def edit
  end

  # POST /entregadors or /entregadors.json
  def create
    @entregador = Entregador.new(entregador_params)

    respond_to do |format|
      if @entregador.save
        format.html { redirect_to @entregador, notice: "Entregador was successfully created." }
        format.json { render :show, status: :created, location: @entregador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entregador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entregadors/1 or /entregadors/1.json
  def update
    respond_to do |format|
      if @entregador.update(entregador_params)
        format.html { redirect_to @entregador, notice: "Entregador was successfully updated." }
        format.json { render :show, status: :ok, location: @entregador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entregador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entregadors/1 or /entregadors/1.json
  def destroy
    @entregador.destroy
    respond_to do |format|
      format.html { redirect_to entregadors_url, notice: "Entregador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entregador
      @entregador = Entregador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entregador_params
      params.require(:entregador).permit(:nome, :telefone, :cpf)
    end
end
