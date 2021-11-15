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
    Then eu vejo uma mensagem de boas vindas para cliente

#Positivo 2
Scenario: login valido como administrador
    Given o administrador com CPF '10120230340' e senha '123456' existe
    And estou na pagina de login
    When eu preencho os campos CPF '10120230340' e senha '123456'
    And clico em login
    Then eu vejo mensagem de boas vindas para administrador

#Positivo 3
Scenario: logout
    Given eu estou logado com usuario de CPF ‘12345678910’
    When eu clico no botao de sair
    Then eu vejo a pagina inicial

#Negativo 1
Scenario: login de cliente com senha incorreta
    Given eu estou na pagina de login
    And o cliente com CPF ‘12345678910’ e senha ‘123456’ existe
    When eu preencho os campos CPF ‘12345678910’ e senha ‘123’
    And clico em login
    Then eu vejo mensagem de senha com senha incorreta

#Negativo 2
Scenario: login de administrador com senha incorreta
    Given eu estou na pagina de login
    And o administrador com CPF ‘10120230340’ e senha ‘123456’ existe
    When eu preencho os campos CPF ‘10120230340’ e senha ‘123’
    And clico em login
    Then eu vejo mensagem de senha com senha incorreta
