*** Settings ***

#Library               Browser
#Library               resources/libs/mongo.py
#Library               FakerLibrary
Resource               ${EXECDIR}/resources/base.robot
Resource               ../resources/pages/signup.robot
Library                ../resources/libs/mongo.py

*** Test Cases ***
Deve cadastrar um novo usuario
      &{user}=            Create Dictionary    name=Joice Moraes        email=joicemoraes@gmail.com    password=mudar123
      Remove User By Email        ${user}[email]

       Start Session
       Go to signup
       Register user        ${user}
       Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.
    

Usuario duplicado
      [Tags]    dup

      &{user}=            Create Dictionary    name=Jose Maria        email=josemaria@gmail.com    password=mudar123
      Remove User By Email        ${user}[email]

      Start Session
      Go to signup
      Register user        ${user}
      Register user        ${user}
      Notice should be     Oops! Já existe um cadastro com e-mail informado.









