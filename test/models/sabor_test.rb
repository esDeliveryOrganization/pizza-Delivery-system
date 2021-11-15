require 'test_helper'

class SaborTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'sabor deve ser salvo' do
    sabor = Sabor.new nome: 'Sabor de teste', preco: '30.0'
    assert sabor.save
  end

  # Cadastro invalido (viola validates de nome)
  test 'nao deve cadastrar sabor sem nome' do
    sabor = Sabor.new nome: '', preco: '30.0'
    assert_not sabor.save
  end

  # Cadastro invalido (viola validates de preco)
  test 'nao deve cadastrar sabor sem preco' do
    sabor = Sabor.new nome: 'Sabor de teste', preco: ''
    assert_not sabor.save
  end
end
