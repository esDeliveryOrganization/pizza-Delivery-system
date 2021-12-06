class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  before_action :checkStatus, only: %i[ update edit destroy ]
  before_action :checkHorario, only: %i[ update edit destroy create new ]
  before_action :authenticate_user!

  # GET /pedidos or /pedidos.json
  def index
    if current_user.adm?
      @pedidos = Pedido.all
    else
      @pedidos = Pedido.where(cpfDestinatario: current_user.cpf)
    end
  end

  def checkHorario
    loja = Loja.first
    if (Time.new.strftime("%H:%M") < loja.abertura.strftime("%H:%M") || Time.new.strftime("%H:%M") > loja.fechamento.strftime("%H:%M")) && !current_user.nil? && !current_user.adm?
      redirect_to root_path, alert: "A loja não está em funcionamento nesse horário"
    end
  end

  def checkStatus
    unless current_user.adm
      if @pedido.status != "Visto" && @pedido.status !=  "Esperando Visualização"
        redirect_to @pedido, alert: "O pedido não pode mais ser editado."
      end
    end
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
  end


  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.cpfDestinatario = current_user.cpf
    @pedido.nomeDestinatario ||= current_user.nome
    @pedido.contato ||= current_user.telefone

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

      definir_quantidade_de_fatias

      @pedido.precoTotal = @pedido.quantidadePizzas * @pedido.pizza.preco

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

  def definir_quantidade_de_fatias
    if @pedido.pizza.tamanho == 1
      @pedido.pizza.fatias = 6
    elsif @pedido.pizza.tamanho == 1.5
      @pedido.pizza.fatias = 8
    elsif @pedido.pizza.tamanho == 1.8
      @pedido.pizza.fatias = 12
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

      definir_quantidade_de_fatias

      precoTotal = @pedido.quantidadePizzas * @pedido.pizza.preco
      @pedido.update(precoTotal: precoTotal)
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.update(status: "Cancelado")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:endereco_id, :entregador_id, :precoTotal, :status, :quantidadePizzas, :observacao, :nomeDestinatario, :contato, :cpfDestinatario, :pizza_attributes => [:tamanho, :fatias, :preco, :observacao, :sabor1_id, :sabor2_id])
    end
end
