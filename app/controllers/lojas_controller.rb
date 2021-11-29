class LojasController < ApplicationController
  before_action :set_loja, only: %i[ show edit update destroy ]
  before_action :checkNewLoja, only: %i[ new index create destroy ]

  # GET /lojas or /lojas.json
  def index
    @lojas = Loja.all
  end

  def checkNewLoja
    redirect_to root_path, alert: "Não é possível criar uma nova Loja"
  end

  # GET /lojas/1 or /lojas/1.json
  def show
  end

  # GET /lojas/new
  def new
    @loja = Loja.new
  end

  # GET /lojas/1/edit
  def edit
  end

  # POST /lojas or /lojas.json
  def create
    @loja = Loja.new(loja_params)
    respond_to do |format|
      if @loja.save
        format.html { redirect_to @loja, notice: "Loja was successfully created." }
        format.json { render :show, status: :created, location: @loja }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lojas/1 or /lojas/1.json
  def update
    respond_to do |format|
      if @loja.update(loja_params)
        format.html { redirect_to @loja, notice: "Loja was successfully updated." }
        format.json { render :show, status: :ok, location: @loja }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lojas/1 or /lojas/1.json
  def destroy
    @loja.destroy
    respond_to do |format|
      format.html { redirect_to lojas_url, notice: "Loja was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loja
      @loja = Loja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loja_params
      params.require(:loja).permit(:abertura, :fechamento)
    end
end
