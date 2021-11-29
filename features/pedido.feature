Feature: Pedido
  As a cliente
  I want to cadastrar, visualizar, alterar e cancelar pedido
  So that nao faca isso manualmente

#Cenários positivos
#Positivo 1
Scenario: cadastrar pedido
  Given eu estou logado como cliente de cpf '12345678910'
  And o entregador com cpf '15985278994' existe
  And o endereco com cep '56460000' existe
  And estou na pagina de cadastro de pedido
  When eu crio uma pizza com tamanho 'M' e sabor 'Calabresa'
  And escolho o endereco 'Rua nossa senhora da saude' 
  And clico em criar pedido
  Then eu vejo uma mensagem que o pedido foi cadastrado com sucesso

#Positivo 2
Scenario: editar pedido
  Given eu estou logado como cliente de cpf '12345678910'
  And o entregador com cpf '15985278994' existe
  And o endereco com cep '56460000' existe
  And estou na pagina de cadastro de pedido
  When eu crio uma pizza com tamanho 'M' e sabor 'Calabresa'
  And escolho o endereco 'Rua nossa senhora da saude'
  And clico em criar pedido 
  And estou na pagina de pedido
  And existe o pedido de ID ‘1’ 
  And pedido esta com status 'Esperando Visualização'
  When eu clico em editar pedido com ID ‘1’
  And eu altero a pizza para o sabor 'Frango'
  And eu clico em concluir
  Then eu vejo uma mensagem que o pedido foi editado com sucesso

#Positivo 3
Scenario: visualizar pedido
  Given eu estou logado como cliente de cpf '12345678910'
  And o entregador com cpf '15985278994' existe
  And o endereco com cep '56460000' existe
  And estou na pagina de cadastro de pedido
  When eu crio uma pizza com tamanho 'M' e sabor 'Calabresa'
  And escolho o endereco 'Rua nossa senhora da saude'
  And clico em criar pedido 
  And estou na pagina de pedido
  And existe o pedido de ID ‘1’ 
  And eu clico em visualizar pedido com ID ‘1’
  Then eu vejo um pedido com status 'Esperando Visualização'


#Cenários negativos
#Negativo 1
Scenario: cadastrar pedido sem tamanho
  Given eu estou logado como cliente de cpf '12345678910'
  And o entregador com cpf '15985278994' existe
  And o endereco com cep '56460000' existe
  And estou na pagina de cadastro de pedido
  When eu crio uma pizza sem tamanho e sabor
  And clico em criar pedido
  Then eu vejo uma mensagem que para preencher os campos de pizza

#Negativo 2
Scenario: cadastrar pedido sem endereco
  Given eu estou logado como cliente de cpf '12345678910'
  And o entregador com cpf '15985278994' existe
  And o endereco com cep '56460000' existe
  And estou na pagina de cadastro de pedido
  When eu crio uma pizza com tamanho 'M' e sabor 'Calabresa'
  And nao escolho o endereco  
  And clico em criar pedido
  Then eu vejo uma mensagem que o endereco nao existe
