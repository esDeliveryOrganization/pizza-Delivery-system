require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Cadastro valido
  test 'usuario deve ser salvo' do
    usuario = User.new cpf: '70496006446', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'
    assert usuario.save
  end

  # Apenas um usuario e criado
  test 'cadastra apenas um usuario' do
    usuario = User.new cpf: '70496006444', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '87991929394', email: 'usuariodeteste@gmail.com'
    assert usuario.save
    usuarios = User.all
    assert(usuarios.length == 1)
  end

  # Cadastro invalido (viola validate de CPF)
  test 'usuario sem CPF nao deve ser salvo' do
    usuario = User.new cpf: '', password: '123456', password_confirmation: '123456', nome: 'Usuario de teste', telefone: '81999243629', email: 'teste@gmail.com'
    assert_not usuario.save
  end
end