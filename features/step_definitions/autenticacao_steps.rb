#Scenario Positivo
#Scenario 1

Given('o cliente com CPF {string} e senha {string} existe') do |cpf, senha|
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    fill_in 'user[password_confirmation]', :with => senha
    fill_in 'user[nome]', :with => 'Jackson Lima'
    fill_in 'user[telefone]', :with => '87958972859'
    fill_in 'user[email]', :with => 'jack@jack.br'
    click_button 'Sign up'
    expect(page).to have_content("Bem Vindo Cliente")
    click_link 'Sair'
end

Given('estou na pagina de login') do
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
end

When('eu preencho os campos CPF {string} e senha {string}') do |cpf, senha|
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
end

When('clico em login') do
  click_button 'Log in'
end

Then('eu vejo uma mensagem de boas vindas para cliente') do
    expect(page).to have_content("Bem Vindo Cliente")
end

# Scnenario 2
Given('o administrador com CPF {string} e senha {string} existe') do |cpf, senha|
    visit '/'
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
    fill_in 'user_cpf', :with => '12345678978'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
    expect(page).to have_content('Menu')
    expect(page).to have_content('Bem Vindo Administrador')
    click_link 'Clientes'
    click_link 'Novo Cliente'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    fill_in 'user[password_confirmation]', :with => senha
    fill_in 'user[nome]', :with => 'Jackson Lima'
    fill_in 'user[telefone]', :with => '87958972859'
    fill_in 'user[email]', :with => 'jack@jack.br'
    fill_in 'user[adm]', :with => '1'
    click_button 'Sign up'
    visit '/'
    click_link 'Sair'
end

Then('eu vejo mensagem de boas vindas para administrador') do
    expect(page).to have_content('Bem Vindo Administrador')
end

#Scenario 3
Given('eu estou logado com usuario de CPF ‘{int}’') do |cpf|
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => '123456'
    fill_in 'user[password_confirmation]', :with => '123456'
    fill_in 'user[nome]', :with => 'Jackson Lima'
    fill_in 'user[telefone]', :with => '8740028922'
    fill_in 'user[email]', :with => 'jack@jack.br'
    click_button 'Sign up'
end

When('eu clico no botao de sair') do
    click_link 'Sair'
end

Then('eu vejo a pagina inicial') do
    expect(page).to have_current_path('/')
end

#Scenario negativo 1
Given('eu estou na pagina de login') do
    visit '/users/sign_in'
end

Given('o cliente com CPF ‘{int}’ e senha ‘{int}’ existe') do |cpf, senha|
    visit '/users/sign_in'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    click_button 'Log in'
end

When('eu preencho os campos CPF ‘{int}’ e senha ‘{int}’') do |cpf, senha|
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    click_button 'Log in'
end

Then('eu vejo mensagem de senha com senha incorreta') do
    expect(page).to have_content('Invalid Cpf or password')
end

#Scenario negativo 2
Given('o administrador com CPF ‘{int}’ e senha ‘{int}’ existe') do |cpf, senha|
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    click_button 'Log in'
end


