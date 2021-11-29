Feature: Controlar loja
  As a administrador
  I want to alterar horario de funcionamento, visualizar e editar pedido
  So that nao faca isso manualmente

#Scenario Positivo 1
Scenario: modificar status do pedido
  Given o administrador com CPF '10120230340' e senha '102030' existe
  And estou logado como administrador com CPF '10120230340' e senha '102030'
  And o entregador com cpf '15985278994' existe 
  And o endereco com cep '56460000' existe  
  And estou na pagina de cadastro de pedido 
  When eu crio uma pizza com tamanho M e sabor 'Calabresa' 
  And escolho o endereco 'Rua nossa senhora da saude' 
  And clico em criar pedido
  And estou na pagina de pedido
  And existe o pedido de ID ‘1’
  And eu clico em editar um pedido com ID ‘1’
  And altero o status da pizza para 'Entregue'
  And eu clico em concluir
  Then eu vejo uma mensagem que o pedido foi editado com sucesso

#Scenario Positivo 2
Scenario: visualizar pedido
  Given o administrador com CPF '10120230340' e senha '102030' existe
  And estou logado como administrador com CPF '10120230340' e senha '102030'
  And o entregador com cpf '15985278994' existe 
  And o endereco com cep '56460000' existe  
  And estou na pagina de cadastro de pedido 
  When eu crio uma pizza com tamanho M e sabor 'Calabresa' 
  And escolho o endereco 'Rua nossa senhora da saude' 
  And clico em criar pedido
  And estou na pagina de pedido
  And existe o pedido de ID ‘1’
  And eu clico em visualizar pedido com ID ‘1’
  Then Eu vejo um pedido com status 'Esperando Visualização'

#Scenario Positivo 3
Scenario: modificar entregador do pedido
  Given o administrador com CPF '10120230340' e senha '102030' existe
  And estou logado como administrador com CPF '10120230340' e senha '102030'
  And o entregador com cpf '15985278994' existe 
  And o endereco com cep '56460000' existe  
  And estou na pagina de cadastro de pedido 
  When eu crio uma pizza com tamanho M e sabor 'Calabresa' 
  And escolho o endereco 'Rua nossa senhora da saude' 
  And clico em criar pedido
  And estou na pagina de pedido
  And existe o pedido de ID ‘1’
  And eu clico em editar um pedido com ID ‘1’
  And eu altero o entregador para 'Flavio Torres'
  And eu clico em concluir
  Then eu vejo uma mensagem que o pedido foi editado com sucesso
