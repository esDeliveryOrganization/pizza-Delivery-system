require 'test_helper'

class EntregadorTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'entregador deve ser salvo' do
    entregador = Entregador.new cpf: '70086904337', nome: 'Entregador de teste', telefone: '87999132767'
    assert entregador.save
  end

  # Edicao valida
  test 'entregador deve ser alterado' do
    entregador = Entregador.new cpf: '70086904337', nome: 'Entregador de teste', telefone: '87999132767'
    assert entregador.save
    assert entregador.update cpf: '60489003254', nome: 'Nome do entregador', telefone: '87999251454'
  end

  # Remocao
  test 'entregador deve ser removido' do
    entregador = Entregador.new cpf: '70086904337', nome: 'Entregador de teste', telefone: '87999132767'
    assert entregador.save
    assert entregador.delete
  end
end