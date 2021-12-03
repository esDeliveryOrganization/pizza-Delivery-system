require 'test_helper'

class SaborTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'sabor deve ser salvo' do
    sabor = Sabor.new descricao: 'Sabor de teste', preco: '30.0'
    assert sabor.save
  end

  # Cadastro invalido (viola validates de descricao)
  test 'nao deve cadastrar sabor sem descricao' do
    sabor = Sabor.new descricao: '', preco: '30.0'
    assert_not sabor.save
  end

  # Cadastro invalido (viola validates de preco)
  test 'nao deve cadastrar sabor sem preco' do
    sabor = Sabor.new descricao: 'Sabor de teste', preco: ''
    assert_not sabor.save
  end
end
