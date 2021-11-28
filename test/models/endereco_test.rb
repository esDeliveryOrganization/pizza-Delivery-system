require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  usuario = User.new cpf: '12312312390', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'

  test 'endereco deve ser salvo' do
    usuario = User.new cpf: '12312312332', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'
    assert usuario.save
    endereco = Endereco.new cep: '55317569', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20', user_id: usuario.id
    assert endereco.save
  end

  # Cadastro invalido (viola validade de CEP)
  test 'endereco nao deve ser salvo sem CEP' do
    usuario = User.new cpf: '12345678956', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'
    assert usuario.save
    endereco = Endereco.new cep: '', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20', user_id: usuario.id
    assert_not endereco.save
  end

  # Edicao valida
  test 'endereco deve ser alterado' do
    usuario = User.new cpf: '12345678930', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'
    assert usuario.save
    endereco = Endereco.new cep: '55244210', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20', user_id: usuario.id
    assert endereco.save
    assert endereco.update cep: '55317504', cidade: 'Outra cidade', bairro: 'Outro bairro', logradouro: 'Avenida principal', complemento: 'Apto 303'
  end
end
