#Scenario Positivo 1
When('eu clico em editar um pedido com ID ‘{int}’') do |id|
    expect(page).to have_content(id)
    click_link "Edit"
end

When('altero o status da pizza para {string}') do |status|
    choose('pedido_status_entregue')
end

#Scenario Positivo 2 
Then('Eu vejo um pedido com status {string}') do |status|
    expect(page).to have_content(status)
end

#Scenario Positivo 3 
When('eu altero o entregador para {string}') do |entregador|
    select entregador, from:'pedido[entregador_id]'
end