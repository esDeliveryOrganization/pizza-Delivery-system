Feature: Autenticacao
  As a usuario
  I want to logar e deslogar do sistema
  So that eu possa utilizar o sistema e sair dele

#Positivo 1
Scenario: login valido como cliente
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou na pagina de login
    When eu preencho os campos CPF '12345678910' e senha '123456'
    And clico em login
    Then vejo uma mensagem de login realizado com sucesso

#Positivo 2
Scenario: login valido como administrador
    Given o administrador com CPF '10120230340' e senha '123456' existe
    And estou na pagina de login
    When eu preencho os campos CPF '10120230340' e senha '123456'
    And clico em login
    Then vejo uma mensagem de login realizado com sucesso

#Positivo 3
Scenario: logout
    Given eu estou logado com usuario de CPF '12345678910'
    When eu clico no botao de sair
    Then vejo uma mensagem de logout realizado

#Negativo 1
Scenario: login de cliente com senha incorreta
    Given o cliente com CPF '12345678910' e senha '123456' existe
    And estou na pagina de login
    When eu preencho os campos CPF '12345678910' e senha '123'
    And clico em login
    Then vejo mensagem de login invalido

#Negativo 2
Scenario: login de administrador com senha incorreta
    Given o administrador com CPF '10120230340' e senha '123456' existe
    And estou na pagina de login
    When eu preencho os campos CPF '10120230340' e senha '123'
    And clico em login
    Then vejo mensagem de login invalido
