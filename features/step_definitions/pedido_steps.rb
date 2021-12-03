Given('estou logado como cliente de cpf {string} e senha {string}') do |cpf, senha|
    visit '/users/sign_in'
    expect(page).to have_current_path('/users/sign_in')
    fill_in 'user_cpf', :with => cpf
    fill_in 'user_password', :with => senha
    click_button 'Log in'
    expect(page).to have_content('Menu')
    expect(page).to have_content('Bem Vindo Cliente')
end

Given('o endereco com logradouro {string} existe') do |logradouro|
    visit '/enderecos/new'
    fill_in 'endereco[cep]', :with => '55293201'
    fill_in 'endereco[cidade]', :with => 'Cidade de teste'
    fill_in 'endereco[bairro]', :with => 'Centro'
    fill_in 'endereco[logradouro]', :with => logradouro
    fill_in 'endereco[complemento]', :with => 'Casa 19'
    click_button 'Create Endereco'
    expect(page).to have_content('Endereco was successfully created.')
end

Given('estou na pagina de cadastro de pedido') do
    visit '/pedidos/new'
end

When('eu crio uma pizza com sabor {string}') do |sabor|
    select sabor, from:'pedido[pizza_attributes][sabor1_id]'
    select sabor, from:'pedido[pizza_attributes][sabor2_id]'
end

When('escolho o tamanho {string}') do |tamanho,|
    case tamanho
    when 'P'
        choose('pedido_pizza_attributes_tamanho_1')
    when 'M'
        choose('pedido_pizza_attributes_tamanho_1_5')
    when 'G'
        choose('pedido_pizza_attributes_tamanho_1_8')
    end
end

When('escolho o endereco com logradouro {string}') do |endereco|
    select endereco, from:'pedido[endereco_id]'
end

When('clico em criar pedido') do
    click_button 'Create Pedido'
end

Then('eu vejo uma mensagem que o pedido foi cadastrado com sucesso') do
    expect(page).to have_content('Pedido was successfully created.')
end

Given('o pedido de ID {string} para logradouro {string} existe') do |id, logradouro|
    visit '/pedidos/new'
    choose('pedido_pizza_attributes_tamanho_1')
    select 'Calabresa', from:'pedido[pizza_attributes][sabor1_id]'
    select logradouro, from:'pedido[endereco_id]'
    click_button 'Create Pedido'
    expect(page).to have_content('Pedido was successfully created.')
    texto_esperado = 'ID: ' + id
    expect(page).to have_content(texto_esperado)
end

Given('o pedido de ID {string} tem status {string}') do |id, status|
    visit '/pedidos'
    click_link "S-#{id}"
    expect(page).to have_content(status)
end

Given('estou na pagina de pedido') do
    visit '/pedidos' 
end

When('eu clico em visualizar pedido de ID {string}') do |id|
    click_link "S-#{id}"
    texto_esperado = 'ID: ' + id
    expect(page).to have_content(texto_esperado)
end

When('eu clico em editar') do
    click_link 'Edit'
end

When('altero a pizza para tamanho {string}') do |tamanho|
    case tamanho
    when 'P'
        choose('pedido_pizza_attributes_tamanho_1')
    when 'M'
        choose('pedido_pizza_attributes_tamanho_1_5')
    else
        choose('pedido_pizza_attributes_tamanho_1_8')
    end
end

When('clico em atualizar pedido') do
    click_button 'Update Pedido'
end

Then('eu vejo uma mensagem que o pedido foi editado com sucesso') do
    expect(page).to have_content('Pedido was successfully updated.')
end

Then('eu vejo o pedido com ID {string} e logradouro {string}') do |id, logradouro|
    texto_esperado = 'ID: ' + id
    expect(page).to have_content(texto_esperado)
    texto_esperado = 'Endereco: ' + id
    expect(page).to have_content(texto_esperado)
end

Then('eu vejo uma mensagem para preencher os campos de pizza') do
    expect(page).to have_content('Pizza Preencha os campos de pizza')
end

Then('eu vejo uma mensagem que o endereco nao existe') do
    expect(page).to have_content('Endereco must exist')
end