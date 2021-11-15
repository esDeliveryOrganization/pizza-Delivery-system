require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'endereco deve ser salvo' do
    endereco = Endereco.new cep: '55244210', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20'
    assert endereco.save
  end

  # Cadastro invalido (viola validade de CEP)
  test 'endereco nao deve ser salvo sem CEP' do
    endereco = Endereco.new cep: '', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20'
    assert_not endereco.save
  end

  # Edicao valida
  test 'endereco deve ser alterado' do
    endereco = Endereco.new cep: '55244210', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20'
    assert endereco.save
    assert endereco.update cep: '55317504', cidade: 'Outra cidade', bairro: 'Outro bairro', logradouro: 'Avenida principal', complemento: 'Apto 303'
  end
end
