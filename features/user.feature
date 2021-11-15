Feature: Usuario
  As a usuario
  I want to adicionar, visualizar e editar e remover meu cadastro
  So that eu nao tenha que fazer isso de forma manual

  # Positivo
  Scenario: realizar cadastro de cliente
    Given estou na pagina de cadastro de cliente
    When preencho os campos de CPF com '12345678910', senha '123456', confirmacao de senha '123456', nome 'Jorge Vilela', telefone '87999921366', email 'jorgev@gmail.com'
    And clico em sign up
    Then vejo a pagina do menu

  # Positivo
  Scenario: remover cadastro
    Given estou logado com o CPF '10120230310'
    And estou no menu
    When clico em editar login
    And clico em cancelar minha conta
    Then vejo a pagina inicial

  # Positivo
  Scenario: editar senha valida
    Given estou logado com o CPF '10120230310'
    And estou no menu
    When clico em editar login
    And preencho os campos de senha com '000111', confirmacao de senha com '000111' e senha atual com '010203'
    And clico em atualizar
    Then vejo a pagina do menu

  # Negativo
  Scenario: cadastro de cliente com CPF de tamanho invalido
    Given estou na pagina de cadastro de cliente
    When preencho os campos de CPF com '12345', senha '12345678', confirmacao de senha '12345678', nome 'Walter Ramos', telefone '81993176460', email 'walterramos@hotmail.com'
    And clico em sign up
    Then vejo a mensagem de CPF com tamanho invalido

  # Negativo
  Scenario: editar com telefone invalido
    Given estou logado com o CPF '10120230310'
    And estou no menu
    When clico em editar login
    And preencho os campos de senha atual com '010203', confirmacao de senha com '010203' e telefone com 'BR87999221364'
    And clico em atualizar
    Then vejo a a mensagem de telefone invalido