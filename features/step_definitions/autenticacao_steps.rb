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

Then('vejo uma mensagem de login realizado com sucesso') do
    expect(page).to have_content('Signed in successfully.')
end

Given('o administrador com CPF {string} e senha {string} existe') do |cpf, senha|
    visit '/'
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
    fill_in 'user_cpf', :with => '12345678978'
    fill_in 'user_password', :with => '123456'
    click_button 'Log in'
    expect(page).to have_content('Menu')
    expect(page).to have_content('Bem Vindo Administrador')
    click_link 'Administradores'
    click_link 'Novo Administrador'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => senha
    fill_in 'user[password_confirmation]', :with => senha
    fill_in 'user[nome]', :with => 'Jackson Lima'
    fill_in 'user[telefone]', :with => '87958972859'
    fill_in 'user[email]', :with => 'jack@jack.br'
    fill_in 'user[adm]', :with => 'true'
    click_button 'Sign up'
    visit '/'
    click_link 'Sair'
end

When('eu clico no botao de sair') do
    click_link 'Sair'
end

Then('vejo uma mensagem de logout realizado') do
    expect(page).to have_content('Signed out successfully.')
end

Then('vejo mensagem de login invalido') do
    expect(page).to have_content('Invalid Cpf or password')
end
