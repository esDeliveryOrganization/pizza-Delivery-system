Given('estou logado como administrador com CPF {string} e senha {string}') do |cpf, senha|
  visit '/'
  # Ao visitar a home, cria-se um administrador padrao
  visit '/users/sign_in'
  expect(page).to have_current_path('/users/sign_in')
  fill_in 'user_cpf', :with => cpf
  fill_in 'user_password', :with => senha
  click_button 'Log in'
  expect(page).to have_content('Menu')
  expect(page).to have_content('Bem Vindo Administrador')
end

Given('estou na pagina de sabores') do
  visit('/sabors')
  expect(page).to have_current_path('/sabors')
end

When('clico em cadastrar sabor') do
  click_link 'New Sabor'
end

When('crio um sabor com nome {string} e preco ’{float}’') do |nome, preco|
  fill_in 'sabor_nome', :with => nome
  fill_in 'sabor_preco', :with => preco
  click_button 'Create Sabor'
end

Then('vejo uma mensagem que o sabor foi cadastrado com sucesso') do
  expect(page).to have_content('Sabor was successfully created.')
end

Given('o sabor com nome {string} existe') do |sabor|
  visit '/sabors/new'
  fill_in 'sabor_nome', :with => sabor
  fill_in 'sabor_preco', :with => 25
  click_button 'Create Sabor'
  expect(page).to have_content('Sabor was successfully created.')
end

When('clico em remover o sabor com nome {string}') do |sabor|
  expect(page).to have_content(sabor)
  click_button "a-#{sabor}"
end

Then('vejo uma mensagem que o sabor foi apagado com sucesso') do
  expect(page).to have_content('Sabor was successfully destroyed.')
end

When('clico em editar sabor com nome {string}') do |sabor|
  expect(page).to have_content(sabor)
  click_link "e-#{sabor}"
end

When('altero o preco para ’{float}’') do |preco|
  fill_in 'sabor_preco', :with => preco
end

When('clico em atualizar sabor') do
  click_button 'Update Sabor'
end

Then('vejo uma mensagem que o sabor foi atualizado com sucesso') do
  expect(page).to have_content('Sabor was successfully updated.')
end

Then('vejo uma mensagem de nome invalido') do
  expect(page).to have_content('Nome Must have at least 3 characters!')
end

Then('vejo uma mensagem de preco invalido') do
  expect(page).to have_content('Preco must be greater than or equal to 0')
end