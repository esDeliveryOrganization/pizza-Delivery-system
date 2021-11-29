require "test_helper"

class PedidoTest < ActiveSupport::TestCase
  # Cadastro invalido (viola validate de pizza)
  test 'pedido deve ter pizza' do
    usuario = User.new cpf: '01265478900', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuario@gmail.com'
    assert usuario.save
    endereco = Endereco.new cep: '55317569', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20', user_id: usuario.id
    assert endereco.save
    entregador = Entregador.new cpf: '70460307145', nome: 'Entregador de teste', telefone: '87999132767'
    assert entregador.save
    sabor = Sabor.new nome: 'Sabor de teste', preco: '30.0'
    assert sabor.save

    pedido = Pedido.new(endereco_id: endereco.id, entregador_id: entregador.id, precoTotal: 1 * 23.0, status: 'Esperando Visualização', qtdPizzas: '1', obs: 'Nenhuma', nomeDest: usuario.nome, contato: usuario.telefone, cpfDest: usuario.cpf, :pizza_attributes => {tamanho:'1', fatias:'6', preco:'23', desc: 'nenhuma', sabor1_id:sabor.id, sabor2_id:nil})
    assert_not pedido.save
  end

  # Cadastro invalido (deve ter entregador)
  test 'pedido deve ter entregador' do
    usuario = User.new cpf: '01265478900', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuario@gmail.com'
    assert usuario.save
    endereco = Endereco.new cep: '55317560', cidade: 'Cidade de teste', bairro: 'Bairro B', logradouro: 'Centro', complemento: 'Casa 20', user_id: usuario.id
    assert endereco.save
    sabor = Sabor.new nome: 'Sabor de teste', preco: '30.0'
    assert sabor.save

    pedido = Pedido.new(endereco_id: endereco.id, precoTotal: 1 * 23.0, status: 'Esperando Visualização', qtdPizzas: '1', obs: 'Nenhuma', nomeDest: usuario.nome, contato: usuario.telefone, cpfDest: usuario.cpf, :pizza_attributes => {tamanho:'1', fatias:'6', preco:'23', desc: 'nenhuma', sabor1_id:sabor.id, sabor2_id:nil})
    assert_not pedido.save
  end

  # Cadastro invalido
  test 'pedido deve ter endereco' do
    usuario = User.new cpf: '01265478900', password: '123456', password_confirmation: '123456', nome: 'Usuario', telefone: '87991901265', email: 'usuario@gmail.com'
    assert usuario.save
    entregador = Entregador.new cpf: '70460307145', nome: 'Entregador de teste', telefone: '87999132767'
    assert entregador.save
    sabor = Sabor.new nome: 'Sabor de teste', preco: '30.0'
    assert sabor.save

    pedido = Pedido.new(entregador_id: entregador.id, precoTotal: 1 * 23.0, status: 'Esperando Visualização', qtdPizzas: '1', obs: 'Nenhuma', nomeDest: usuario.nome, contato: usuario.telefone, cpfDest: usuario.cpf, :pizza_attributes => {tamanho:'1', fatias:'6', preco:'23', desc: 'nenhuma', sabor1_id:sabor.id, sabor2_id:nil})
    assert_not pedido.save
  end
end
