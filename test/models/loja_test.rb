require "test_helper"

class LojaTest < ActiveSupport::TestCase
  require 'test_helper'
  # Cadastro valido
  test 'loja deve ser salva' do
    loja = Loja.new abertura: '18:00', fechamento: '23:59'
    assert loja.save
  end

  # Cadastro invalido (viola validates de abertura)
  test 'cadastar loja com horario invalido' do
    loja = Loja.new abertura: '', fechamento: '20:00'
    assert_not loja.save
  end

  # Edição invalida (viola validates de horarios)
  test 'editar horario de loja para horario inválido' do
    loja = Loja.new abertura: '19:00', fechamento: '23:59'
    assert loja.save
    assert_not loja.update(fechamento: "18:00")
  end
end
