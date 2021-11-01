class SaborsController < ApplicationController
  before_action :set_sabor, only: %i[ show edit update destroy ]

  # GET /sabors or /sabors.json
  def index
    @sabors = Sabor.all
  end

  # GET /sabors/1 or /sabors/1.json
  def show
  end

  # GET /sabors/new
  def new
    @sabor = Sabor.new
  end

  # GET /sabors/1/edit
  def edit
  end

  # POST /sabors or /sabors.json
  def create
    @sabor = Sabor.new(sabor_params)

    respond_to do |format|
      if @sabor.save
        format.html { redirect_to @sabor, notice: "Sabor was successfully created." }
        format.json { render :show, status: :created, location: @sabor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sabor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sabors/1 or /sabors/1.json
  def update
    respond_to do |format|
      if @sabor.update(sabor_params)
        format.html { redirect_to @sabor, notice: "Sabor was successfully updated." }
        format.json { render :show, status: :ok, location: @sabor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sabor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sabors/1 or /sabors/1.json
  def destroy
    @sabor.destroy
    respond_to do |format|
      format.html { redirect_to sabors_url, notice: "Sabor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sabor
      @sabor = Sabor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sabor_params
      params.require(:sabor).permit(:nome, :preco)
    end
end
