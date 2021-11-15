#Scenario Positivo
#Scenario 1

Given('o cliente com CPF ´{int}´ e senha ´{int}´ existe') do |cpf, senha|
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    click_button 'log in'
end

Given('estou na pagina de boas vindas') do
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
    click_link 'Sign up'
    #expect(page).to have_current_path('/users/sign_up')
end

When('eu preencho os campos CPF ‘{int}’ e senha ‘{int}’') do |int, int2|
    fill_in 'user[cpf]', :with => ‘12345678910’
    fill_in 'user[password]', :with => ‘123456’
end

When('clico em login') do
  click_button 'log in'
end

Then('eu vejo mensagem de boas vindas para cliente') do
    expect(page).to have_content('Bem vindo cliente.')
end

# #Scnenario 2
# Given('eu estou na pagina de login') do
#     visit '/users/sign_in'
#     #expect(page).to have_current_path('/users/sign_in')
#     click_link 'Sign up'
#     #expect(page).to have_current_path('/users/sign_up')
# end
#
# Given('o administrador com CPF {string} e senha {string} existe') do |cpf, senha|
#     fill_in 'user[cpf]', :with => cpf
#     fill_in 'user[password]', :with => senha
#     fill_in 'user[password_confirmation]', :with => senha
#     fill_in 'user[nome]', :with => 'Jackson Lima'
#     fill_in 'user[telefone]', :with => '87958972859'
#     fill_in 'user[email]', :with => 'jack@jack.br'
#     click_button 'Sign up'
# end
#
# When('eu preencho os campos CPF {string} e senha {string}') do |cpf, senha|
#     fill_in 'user[cpf]', :with => '10120230340'
#     fill_in 'user[password]', :with => '123456'
#     select(role, :from => 'user[role]')
# end
#
# When('clico em login') do
#     click_button 'Log in'
# end
#
# Then('eu vejo mensagem de boas vindas para administrador') do
#     expect(page).to have_content('Bem vindo adminstrador.')
# end
#
#
# #Scenario 3
# Given('eu estou logado com usuario de CPF ‘{int}’') do |int|
#     fill_in 'user[cpf]', :with => ‘12345678910’
#     click_button 'Sign in'
#     visit '/menu'
#     expect(page).to have_current_path('/menu_admininstrador_index_path')
# end
#
# When('eu clico no botao de sair') do
#   click_button 'log out'
# end
#
# Then('eu vejo a pagina de login') do
#     expect(page).to have_content('Signed out successfully.')
# end
#
#
# #Scenario Negativo
# #Scenario 1
# Given('eu estou na pagina de login') do
#     visit '/login'
#     click_link 'login'
# end
#
# Given('o cliente com CPF ‘{int}’ e senha ‘{int}’ existe') do |int, int2|
#     fill_in 'user[cpf]', :with => ‘12345678910’
#     fill_in 'user[password]', :with => ‘123456’
#     click_button 'Sign in'
# end
#
# When('eu preencho os campos CPF ‘{int}’ e senha ‘{int}’') do |int, int2|
#     fill_in 'user[cpf]', :with => ‘12345678910’
#     fill_in 'user[password]', :with => ‘123’
#     click_button 'Sign in'
# end
#
# When('clico em login') do
#     click_button 'log in'
# end
#
# Then('eu vejo mensagem de senha com tamanho invalido') do
#     expect(page).to have_content('Senha deve ter no mínimo 6 digitos.')
# end
#
#
# #Scenario 2
# Given('eu estou na pagina de login') do
#     visit '/users/sign_in'
#     click_link 'Sign up'
# end
#
# Given('o administrador com CPF ‘{int}’ e senha ‘{int}’ existe') do |int, int2|
#     fill_in 'user[cpf]', :with => ‘12345678910’
#     fill_in 'user[password]', :with => ‘123456’
#     click_button 'Sign in'
#
# end
#
# When('eu preencho os campos CPF ‘{int}’ e senha ‘{int}’') do |int, int2|
#     fill_in 'autentificacao[cpf]', :with => '10120230340'
#     fill_in 'autentificacao[password]', :with => '123'
#     click_button 'log in'
# end
#
#
# When('clico em login') do
#     click_button 'log in'
# end
#
# Then('eu vejo mensagem de senha com tamanho invalido') do
#     expect(page).to have_content('Senha deve ter no mínimo 6 digitos.')
# end


