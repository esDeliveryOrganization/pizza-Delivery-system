Feature: Pedido
  As a cliente
  I want to cadastrar, visualizar, alterar e cancelar pedido
  So that nao faca isso manualmente

  # Positivo
  Scenario: cadastrar pedido
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou logado como cliente de cpf '12345678910' e senha '123456'
    And o endereco com logradouro 'Rua B' existe
    And estou na pagina de cadastro de pedido
    When eu crio uma pizza com sabor 'Calabresa'
    And escolho o tamanho 'M'
    And escolho o endereco com logradouro 'Rua B'
    And clico em criar pedido
    Then eu vejo uma mensagem que o pedido foi cadastrado com sucesso

  # Positivo
  Scenario: editar pedido
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou logado como cliente de cpf '12345678910' e senha '123456'
    And o endereco com logradouro 'Rua B' existe
    And o pedido de ID '1' para logradouro 'Rua B' existe
    And o pedido de ID '1' tem status 'Esperando Visualização'
    And estou na pagina de pedido
    When eu clico em visualizar pedido de ID '1'
    And clico em editar
    And altero a pizza para tamanho 'G'
    And clico em atualizar pedido
    Then eu vejo uma mensagem que o pedido foi editado com sucesso

  # Positivo
  Scenario: visualizar pedido
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou logado como cliente de cpf '12345678910' e senha '123456'
    And o endereco com logradouro 'Rua B' existe
    And o pedido de ID '1' para logradouro 'Rua B' existe
    And estou na pagina de pedido
    When eu clico em visualizar pedido de ID '1'
    Then eu vejo o pedido com ID '1' e logradouro 'Rua B'

  # Negativo
  Scenario: cadastrar pedido sem pizza
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou logado como cliente de cpf '12345678910' e senha '123456'
    And o endereco com logradouro 'Rua B' existe
    And estou na pagina de cadastro de pedido
    When escolho o endereco com logradouro 'Rua B'
    And clico em criar pedido
    Then eu vejo uma mensagem para preencher os campos de pizza

  # Negativo
  Scenario: cadastrar pedido sem endereco
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou logado como cliente de cpf '12345678910' e senha '123456'
    And estou na pagina de cadastro de pedido
    When eu crio uma pizza com sabor 'Calabresa'
    And escolho o tamanho 'M'
    And clico em criar pedido
    Then eu vejo uma mensagem que o endereco nao existe
