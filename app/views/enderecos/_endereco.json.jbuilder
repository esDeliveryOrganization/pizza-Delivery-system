json.extract! endereco, :id, :cep, :cidade, :bairro, :logradouro, :complemento, :user, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
