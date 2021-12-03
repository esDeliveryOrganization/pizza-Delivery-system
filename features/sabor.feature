Feature: Sabor
  As a administrador
  I want cadastrar, visualizar, editar e remover um sabor
  So that eu nao tenha que fazer isso de forma manual

  # Positivo
  Scenario: cadastrar sabor
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina de sabores
    When clico em cadastrar sabor
    And crio um sabor com descricao 'Chocolate' e preco ’24.0’
    Then vejo uma mensagem que o sabor foi cadastrado com sucesso

  # Positivo
  Scenario: remover sabor
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o sabor com descricao 'Chocolate' existe
    And estou na pagina de sabores
    When clico em remover o sabor com descricao 'Chocolate'
    Then vejo uma mensagem que o sabor foi apagado com sucesso

  # Positivo
  Scenario: editar sabor existente
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o sabor com descricao 'Chocolate' existe
    And estou na pagina de sabores
    When clico em editar sabor com descricao 'Chocolate'
    And altero o preco para ’23.0’
    And clico em atualizar sabor
    Then vejo uma mensagem que o sabor foi atualizado com sucesso

  # Negativo
  Scenario: cadastrar sabor inserindo descricao invalido
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina de sabores
    When clico em cadastrar sabor
    And crio um sabor com descricao 'C' e preco ’25’
    Then vejo uma mensagem de descricao invalido

  # Negativo
  Scenario: editar sabor inserindo preco invalido
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o sabor com descricao 'Chocolate' existe
    And estou na pagina de sabores
    When clico em editar sabor com descricao 'Chocolate'
    And altero o preco para ’-1’
    And clico em atualizar sabor
    Then vejo uma mensagem de preco invalido

