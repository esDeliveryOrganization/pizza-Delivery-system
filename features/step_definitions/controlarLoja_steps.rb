When('eu clico em editar um pedido com ID ‘{int}’') do |id|
    expect(page).to have_content(id)
    click_link "Edit"
end

When('altero o status da pizza para {string}') do |_status|
    choose('pedido_status_entregue')
end

Then('Eu vejo um pedido com status {string}') do |status|
    expect(page).to have_content(status)
end

When('eu altero o entregador para {string}') do |entregador|
    select entregador, from:'pedido[entregador_id]'
end

Given('estou na pagina do horario da loja') do
    visit('/lojas/1')
    expect(page).to have_current_path('/lojas/1')
end

When('When eu clico em editar pedido de ID {string} ') do |id|
    click_link "e-#{id}"
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