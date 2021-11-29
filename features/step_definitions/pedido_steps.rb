#Scenario Positivo 1
Given('eu estou logado como cliente de cpf {string}') do |cpf|
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[password]', :with => '123456'
    fill_in 'user[password_confirmation]', :with => '123456'
    fill_in 'user[nome]', :with => 'Jackson Lima'
    fill_in 'user[telefone]', :with => '87940028922'
    fill_in 'user[email]', :with => 'jack@jack.br'
    click_button 'Sign up'
end

Given('o endereco com cep {string} existe') do |cep|
    visit '/enderecos/new'
    fill_in 'endereco[cep]', :with => cep
    fill_in 'endereco[cidade]', :with => 'Petrolandia'
    fill_in 'endereco[bairro]', :with => 'Centro'
    fill_in 'endereco[logradouro]', :with => 'Rua nossa senhora da saude'
    fill_in 'endereco[complemento]', :with => 'Casa'
    click_button 'Create Endereco'
    expect(page).to have_content('Endereco was successfully created.')
end

Given('estou na pagina de cadastro de pedido') do
    visit '/pedidos/new' 
end

When('eu crio uma pizza com tamanho {string} e sabor {string}') do |tamanho, sabor|
    expect(page).to have_content('Monte sua Pizza')
    choose('pedido_pizza_attributes_tamanho_1_5')
    select sabor, from:'pedido[pizza_attributes][sabor1_id]'
    select sabor, from:'pedido[pizza_attributes][sabor2_id]'
end

When('escolho o endereco {string}') do |endereco|
    select endereco, from:'pedido[endereco_id]'
end

When('clico em criar pedido') do
    click_button 'Create Pedido'
end

Then('eu vejo uma mensagem que o pedido foi cadastrado com sucesso') do
    expect(page).to have_content('Pedido was successfully created.')
end


#Scenario Positivo 2
Given('estou na pagina de pedido') do
    visit '/pedidos' 
end
  
Given('existe o pedido de ID ‘{int}’') do |id|
    expect(page).to have_content('Pedidos')
end
  
Given('pedido esta com status {string}') do |status|
    expect(page).to have_content(status)
end
  
When('eu clico em editar pedido com ID ‘{int}’') do |id|
    expect(page).to have_content(id)
    click_link "S-#{id}"
    click_link "Edit"
end
  
When('eu altero a pizza para o sabor {string}') do |sabor|
    select sabor, from:'pedido[pizza_attributes][sabor1_id]'
end
  
When('eu clico em concluir') do
    click_button 'Update Pedido'
end
  
Then('eu vejo uma mensagem que o pedido foi editado com sucesso') do
    expect(page).to have_content('Pedido was successfully updated.')
end


#Scenario Positivo 3
When('eu clico em visualizar pedido com ID ‘{int}’') do |id|
    expect(page).to have_content(id)
    click_link 'Show'
end

Then('eu vejo um pedido com status {string}') do |status|
    expect(page).to have_content(status)
end

#Scenario Negativo 1
When('eu crio uma pizza sem tamanho e sabor') do
    click_button 'Create Pedido'
end
  
Then('eu vejo uma mensagem que para preencher os campos de pizza') do
    expect(page).to have_content('Pizza Preencha os campos de pizza')
end

#Scenario Negativo 2
When('nao escolho o endereco') do
    click_button 'Create Pedido'
end
  
Then('eu vejo uma mensagem que o endereco nao existe') do
    expect(page).to have_content('Endereco must exist')
end
  
    