Given('o pedido de ID {string} com destinatario {string} e logradouro {string} existe') do |id, destinatario, logradouro|
    visit '/pedidos/new'
    choose('pedido_pizza_attributes_tamanho_1')
    select 'Calabresa', from:'pedido[pizza_attributes][sabor1_id]'
    select 'Bacon', from:'pedido[pizza_attributes][sabor2_id]'
    select logradouro, from:'pedido[endereco_id]'
    fill_in 'pedido_nomeDestinatario', :with => destinatario
    click_button 'Create Pedido'
    expect(page).to have_content('Pedido was successfully created.')
    texto_esperado = 'ID: ' + id
    expect(page).to have_content(texto_esperado)
end

When('eu clico em editar pedido de ID {string}') do |id|
    click_link "e-#{id}"
end

When('altero o status da pizza para {string}') do |status|
    choose('pedido_pizza_attributes_tamanho_1') # Deve-se marcar o tamanho novamente
    if status.eql? 'Esperando Visualização'
        choose('pedido_status_esperando_visualização')
    elsif status.eql? 'Visto'
        choose('pedido_status_visto')
    elsif status.eql? 'Em preparo'
        choose('pedido_status_em_preparo')
    elsif status.eql? 'Saiu para entrega'
        choose('pedido_status_saiu_para_entrega')
    elsif status.eql? 'Entregue'
        choose('pedido_status_entregue')
    elsif status.eql? 'Cancelado'
        choose('pedido_status_cancelado')
    end
end

When('clico em editar') do
    click_link 'Edit'
end

When('eu clico em atualizar pedido') do
    click_button 'Update Pedido'
end

When('eu altero o entregador para {string}') do |entregador|
    choose('pedido_pizza_attributes_tamanho_1') # Deve-se marcar o tamanho novamente
    select entregador, from:'pedido[entregador_id]'
end

Then('eu vejo pedido com status {string}') do |status|
    expect(page).to have_content(status)
end

Given('estou na pagina do horario da loja') do
    visit('/lojas/1')
    expect(page).to have_current_path('/lojas/1')
end

When('preencho horario de abertura com {string}') do |horario|
    fill_in 'loja_abertura', with:horario
end

When('preencho horario de fechamento com {string}') do |horario|
    fill_in 'loja_fechamento', with:horario
end

When('clico em atualizar loja') do
    click_button "Update Loja"
end

Then('vejo mensagem de loja atualizada com sucesso') do
    expect(page).to have_content('Loja was successfully updated.')
end

Then('vejo mensagem de horario invalido') do
    expect(page).to have_content('Hora de fechamento não pode ser antes da hora de abertura!')
end