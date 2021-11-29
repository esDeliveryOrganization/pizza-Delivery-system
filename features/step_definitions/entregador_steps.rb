Given('estou na pagina de entregadores') do
  visit('/entregadors')
  expect(page).to have_current_path('/entregadors')
end

When('clico em cadastrar entregador') do
  click_link 'Novo Entregador'
end

When('crio um entregador com cpf {string}, nome {string}, telefone {string}') do |cpf, nome, telefone|
  fill_in 'entregador_cpf', :with => cpf
  fill_in 'entregador_nome', :with => nome
  fill_in 'entregador_telefone', :with => telefone
  click_button 'Create Entregador'
end

Then('vejo uma mensagem que o entregador foi cadastrado com sucesso') do
  expect(page).to have_content('Entregador was successfully created.')
end

Given('o entregador com cpf {string} existe') do |cpf|
  visit '/entregadors/new'
  fill_in 'entregador_cpf', :with => cpf
  fill_in 'entregador_nome', :with => 'Flavio Torres'
  fill_in 'entregador_telefone', :with => '87993278922'
  click_button 'Create Entregador'
  expect(page).to have_content('Entregador was successfully created.')
end

When('clico em editar entregador com cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_link "e-#{cpf}"
end

When('altero o nome para {string}') do |nome|
  fill_in 'entregador_nome', :with => nome
end

When('clico em atualizar entregador') do
  click_button 'Update Entregador'
end

Then('vejo uma mensagem que o entregador foi editado com sucesso') do
  expect(page).to have_content('Entregador was successfully updated.')
end

When('clico em remover entregador com cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_button "a-#{cpf}"
end

Then('vejo uma mensagem que o entregador foi apagado com sucesso') do
  expect(page).to have_content('Entregador was successfully destroyed.')
end

Then('vejo uma mensagem de cpf com tamanho invalido') do
  expect(page).to have_content('Cpf is the wrong length')
end

Then('vejo uma mensagem de nome com tamanho minimo invalido') do
  expect(page).to have_content('Nome must have at least 3 characters')
end