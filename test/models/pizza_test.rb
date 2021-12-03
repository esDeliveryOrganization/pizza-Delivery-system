require "test_helper"

class PizzaTest < ActiveSupport::TestCase

  # Cadastro invalido (viola validate de sabor)
  test 'pizza nao deve ser salva sem sabor' do
    pizza = Pizza.new tamanho: '1', sabor1_id: nil, sabor2_id: nil, fatias: '6', preco: '15.0', observacao: 'Sem descricao', pedido_id: '1'
    assert_not pizza.save
  end

  # Cadastro invalido (viola validate de tamanho)
  test 'pizza nao deve ser salva sem tamanho' do
    sabor = Sabor.new descricao: 'Sabor de teste', preco: '30.0'
    pizza = Pizza.new sabor1_id: sabor.id, sabor2_id: nil, fatias: '6', preco: '15.0', observacao: 'Sem descricao', pedido_id: '1'
    assert_not pizza.save
  end

  # Cadastro invalido (deve estar vinculada a pedido)
  test 'pizza nao deve ser salva sem pedido' do
    sabor = Sabor.new descricao: 'Sabor de teste', preco: '30.0'
    pizza = Pizza.new sabor1_id: sabor.id, sabor2_id: nil, fatias: '6', preco: '15.0', observacao: 'Sem descricao'
    assert_not pizza.save
  end

end
