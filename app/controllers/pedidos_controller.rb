class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  

  # GET /pedidos or /pedidos.json
  def index
    if current_user.adm?
      @pedidos = Pedido.all
    else
      @pedidos = Pedido.where(cpfDest: current_user.cpf)
    end
  end

  def checarStatus

  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
    @entregador = Entregador.find_by(id: @pedido.entregador_id).nome
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @pedido.build_pizza
  end

  # GET /pedidos/1/edit
  def edit
    uri = URI.parse(url)
    @params = CGI.parse(uri.query)
  end

  def checarPizzaPreco(pedido)
    unless @pedido.pizza.nil?
      # Associação dos sabores e tamanhos escolhidos
      if !@pedido.pizza.sabor1_id.nil? && !@pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = (Sabor.find_by(id: @pedido.pizza.sabor1_id).preco/2) + (Sabor.find_by(id: @pedido.pizza.sabor2_id).preco/2)
        @pedido.pizza.preco *= @pedido.pizza.tamanho
      elsif !@pedido.pizza.sabor1_id.nil? && @pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = Sabor.find_by(id: @pedido.pizza.sabor1_id).preco * @pedido.pizza.tamanho 

      elsif @pedido.pizza.sabor1_id.nil? && !@pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = Sabor.find_by(id: @pedido.pizza.sabor2_id).preco * @pedido.pizza.tamanho
      end
    end
  end

  def checarPizzaTamanho(pedido)
    # Associação de tamanho da pedido.pizza e quantidade de fatias
    unless @pedido.pizza.nil?  
      if @pedido.pizza.tamanho == 1
        @pedido.pizza.fatias = 6
      elsif @pedido.pizza.tamanho == 1.5
        @pedido.pizza.fatias = 8
      elsif @pedido.pizza.tamanho == 1.8
        @pedido.pizza.fatias = 12
      end
    end
  end

  def checarPizza(pedido)
    unless @pedido.pizza.nil?
      @pedido.precoTotal = @pedido.qtdPizzas * @pedido.pizza.preco
    end
  end


  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.cpfDest = current_user.cpf
    unless @pedido.pizza.nil?
      # Associação dos sabores e tamanhos escolhidos
      if !@pedido.pizza.sabor1_id.nil? && !@pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = (Sabor.find_by(id: @pedido.pizza.sabor1_id).preco/2) + (Sabor.find_by(id: @pedido.pizza.sabor2_id).preco/2)
        @pedido.pizza.preco *= @pedido.pizza.tamanho
      elsif !@pedido.pizza.sabor1_id.nil? && @pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = Sabor.find_by(id: @pedido.pizza.sabor1_id).preco * @pedido.pizza.tamanho 

      elsif @pedido.pizza.sabor1_id.nil? && !@pedido.pizza.sabor2_id.nil?
        @pedido.pizza.preco = Sabor.find_by(id: @pedido.pizza.sabor2_id).preco * @pedido.pizza.tamanho
      end

      if @pedido.pizza.tamanho == 1
        @pedido.pizza.fatias = 6
      elsif @pedido.pizza.tamanho == 1.5
        @pedido.pizza.fatias = 8
      elsif @pedido.pizza.tamanho == 1.8
        @pedido.pizza.fatias = 12
      end

      @pedido.precoTotal = @pedido.qtdPizzas * @pedido.pizza.preco

    end

    @pedido.status = "Esperando Visualização"
    @pedido.entregador_id = Entregador.first.id

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
        @pedido.build_pizza
      end
    end

    
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:endereco_id, :entregador_id, :precoTotal, :status, :qtdPizzas, :obs, :nomeDest, :contato, :cpfDest, :pizza_attributes => [:tamanho, :fatias, :preco, :desc, :sabor1_id, :sabor2_id])
    end
end
