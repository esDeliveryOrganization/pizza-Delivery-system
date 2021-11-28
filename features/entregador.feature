Feature: Entregador
  As a administrador
  I want to cadastrar, visualizar, editar e remover entregador
  So that eu nao tenha que fazer isso de forma manual

  # Positivo
  Scenario: cadastrar entregador
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina de entregadores
    When clico em cadastrar entregador
    And crio um entregador com cpf '98765432100', nome 'Flavio Torres', telefone '87993278922'
    Then vejo uma mensagem que o entregador foi cadastrado com sucesso

  # Positivo
  Scenario: editar entregador
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o entregador com cpf '98765432100' existe
    And estou na pagina de entregadores
    When clico em editar entregador com cpf '98765432100'
    And altero o nome para 'Francisco Torres'
    And clico em atualizar entregador
    Then vejo uma mensagem que o entregador foi editado com sucesso

  # Positivo
  Scenario: remover entregador
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o entregador com cpf '98765432100' existe
    And estou na pagina de entregadores
    When clico em remover entregador com cpf '98765432100'
    Then vejo uma mensagem que o entregador foi apagado com sucesso

  # Negativo
  Scenario: cadastrar entregador com cpf invalido
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And estou na pagina de entregadores
    When clico em cadastrar entregador
    And crio um entregador com cpf '987', nome 'Flavio Torres', telefone '87993278922'
    Then vejo uma mensagem de cpf com tamanho invalido

  # Negativo
  Scenario: editar entregador inserindo nome com tamanho minimo invalido
    Given o administrador com CPF '10120230340' e senha '102030' existe
    And estou logado como administrador com CPF '10120230340' e senha '102030'
    And o entregador com cpf '98765432100' existe
    And estou na pagina de entregadores
    When clico em editar entregador com cpf '98765432100'
    And altero o nome para 'XL'
    And clico em atualizar entregador
    Then vejo uma mensagem de nome com tamanho minimo invalido