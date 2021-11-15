Feature: Autenticacao
  As a usuario
  I want to logar e deslogar do sistema
  So that eu possa utilizar o sistema e sair dele

#Positivo
Scenario: login valido como cliente
    Given estou na pagina de boas vindas
    And o cliente com CPF ´12345678910´ e senha ´123456´ existe
    When eu preencho os campos CPF ‘12345678910’ e senha ‘123456’
    And clico em login
    Then eu vejo mensagem de boas vindas para cliente

#Scenario: login valido como administrador
#    Given eu estou na pagina de login
#    And o administrador com CPF '10120230340' e senha '123456' existe
#    When eu preencho os campos CPF '10120230340' e senha '123456'
#    And clico em login
#    Then eu vejo mensagem de boas vindas para administrador
#
#Scenario: logout
#    Given eu estou logado com usuario de CPF ‘12345678910’
#    When eu clico no botao de sair
#    Then eu vejo a pagina de login
#
##Negativo
#Scenario: login de cliente com senha de tamanho invalido
#    Given eu estou na pagina de login
#    And o cliente com CPF ‘12345678910’ e senha ‘123456’ existe
#    When eu preencho os campos CPF ‘12345678910’ e senha ‘123’
#    And clico em login
#    Then eu vejo mensagem de senha com tamanho invalido
#
#
#Scenario: login de administrador com senha de tamanho invalido
#    Given eu estou na pagina de login
#    And o administrador com CPF ‘10120230340’ e senha ‘123456’ existe
#    When eu preencho os campos CPF ‘10120230340’ e senha ‘123’
#    And clico em login
#    Then eu vejo mensagem de senha com tamanho invalido
