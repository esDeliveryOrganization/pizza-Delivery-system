Feature: Controlar loja
  As a administrador
  I want to alterar horario de funcionamento, visualizar e editar pedido
  So that nao faca isso manualmente

  # Positivo
  Scenario: modificar status do pedido
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o endereco com logradouro 'Rua B' existe
    And o pedido de ID '1' para logradouro 'Rua B' existe
    And o pedido de ID '1' tem status 'Esperando Visualização'
    And estou na pagina de pedido
    When eu clico em editar pedido de ID '1'
    And altero o status da pizza para 'Entregue'
    And eu clico em concluir
    Then eu vejo uma mensagem que o pedido foi editado com sucesso

  # Positivo
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

  # Positivo
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

  # Positivo
  Scenario: alteracao valida do horario de funcionamento
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina do horario da loja
    When clico em editar
    And preencho horario de abertura com '18:00'
    And preencho horario de fechamento com '23:00'
    And clico em atualizar loja
    Then vejo mensagem de loja atualizada com sucesso

  # Negativo
  Scenario: alteracao invalida do horario de funcionamento
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina do horario da loja
    When clico em editar
    And preencho horario de abertura com '18:00'
    And preencho horario de fechamento com '14:00'
    And clico em atualizar loja
    Then vejo mensagem de horario invalido