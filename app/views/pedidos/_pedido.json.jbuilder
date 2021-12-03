json.extract! pedido, :id, :pizza_id, :endereco_id, :entregador_id, :precoTotal, :status, :quantidadePizzas, :observacao, :nomeDestinatario, :contato, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
