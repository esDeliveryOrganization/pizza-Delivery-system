Given('estou na pagina de cadastro de cliente') do
  visit '/users/sign_in'
  expect(page).to have_current_path('/users/sign_in')
  click_link 'Sign up'
  expect(page).to have_current_path('/signup')
end

When('preencho os campos de CPF com {string}, senha {string}, confirmacao de senha {string}, nome {string}, telefone {string}, email {string}') do |cpf, senha, confirmacaoSenha, nome, telefone, email|
  fill_in 'user[cpf]', :with => cpf
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => confirmacaoSenha
  fill_in 'user[nome]', :with => nome
  fill_in 'user[telefone]', :with => telefone
  fill_in 'user[email]', :with => email
end

When('clico em sign up') do
  click_button 'Sign up'
end

Then('vejo uma mensagem de boas vindas') do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

Given('o usuario com CPF {string} existe') do |cpf|
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'user[cpf]', :with => cpf
  fill_in 'user[password]', :with => '010203'
  fill_in 'user[password_confirmation]', :with => '010203'
  fill_in 'user[nome]', :with => 'Raimundo Peixoto'
  fill_in 'user[telefone]', :with => '87999221364'
  fill_in 'user[email]', :with => 'raimundopeixoto@gmail.com'
  click_button 'Sign up'
  expect(page).to have_content('Welcome! You have signed up successfully.')
  click_link 'Sair'
  expect(page).to have_content('Signed out successfully.')
end

Given('estou logado com usuario de CPF {string}') do |cpf|
  visit '/users/sign_in'
  fill_in 'user[cpf]', :with => cpf
  fill_in 'user[password]', :with => '010203'
  click_button 'Log in'
  expect(page).to have_content('Signed in successfully.')
end

Given('estou no menu') do
  expect(page).to have_content('Menu')
  expect(page).to have_content('Bem Vindo')
end

When('clico em editar login') do
  click_link 'Editar login'
end

When('clico em atualizar') do
  click_button 'Update'
end

Then('vejo uma mensagem de conta atualizada com sucesso') do
  expect(page).to have_content('Your account has been updated successfully.')
end

When('preencho os campos de senha com {string}, confirmacao de senha com {string} e senha atual com {string}') do |novaSenha, confirmacaoSenha, senhaAtual|
  fill_in 'user[password]', :with => novaSenha
  fill_in 'user[password_confirmation]', :with => confirmacaoSenha
  fill_in 'user[current_password]', :with => senhaAtual
end

When('clico em cancelar minha conta') do
  click_button 'Cancel my account'
end

Then('vejo a pagina inicial') do
  expect(page).to have_content("Bem vindo ao Sistema")
end

Then('vejo a mensagem de CPF com tamanho invalido') do
  expect(page).to have_content("Cpf is the wrong length (should be 11 characters)")
end

When('preencho os campos de senha atual com {string}, confirmacao de senha com {string} e telefone com {string}') do |senhaAtual, confirmacaoSenha, telefone|
  fill_in 'user[password]', :with => senhaAtual
  fill_in 'user[password_confirmation]', :with => confirmacaoSenha
  fill_in 'user[current_password]', :with => senhaAtual
  fill_in 'user[telefone]', :with => telefone
end

Then('vejo uma mensagem de telefone invalido') do
  expect(page).to have_content("Telefone is not a number")
end
