Feature: Sabor
  As a administrador
  I want cadastrar, visualizar, editar e remover um sabor
  So that eu nao tenha que fazer isso de forma manual

  # Positivo
  Scenario: cadastrar sabor
    Given estou logado como administrador
    And estou na pagina de sabores
    And clico em cadastrar sabor
    And crio um sabor com nome 'Chocolate' e preco ’24.0’
    Then vejo uma mensagem que o sabor foi cadastrado com sucesso

  # Positivo
  Scenario: remover sabor
    Given estou logado como administrador
    And o sabor com nome 'Chocolate' existe
    And estou na pagina de sabores
    When clico em remover o sabor com nome 'Chocolate'
    Then vejo uma mensagem que o sabor foi apagado com sucesso

  # Positivo
  Scenario: editar sabor existente
    Given estou logado como administrador
    And o sabor com nome 'Chocolate' existe
    And estou na pagina de sabores
    When clico em editar sabor com nome 'Chocolate'
    And altero o preco para ’23.0’
    And clico em atualizar sabor
    Then vejo uma mensagem que o sabor foi atualizado com sucesso

  # Negativo
  Scenario: cadastrar sabor inserindo nome invalido
    Given estou logado como administrador
    And estou na pagina de sabores
    When clico em cadastrar sabor
    And crio um sabor com nome 'C' e preco ’25’
    Then vejo uma mensagem de nome invalido

  # Negativo
  Scenario: editar sabor inserindo preco invalido
    Given estou logado como administrador
    And o sabor com nome 'Chocolate' existe
    And estou na pagina de sabores
    When clico em editar sabor com nome 'Chocolate'
    And altero o preco para ’-1’
    And clico em atualizar sabor
    Then vejo uma mensagem de preco invalido
