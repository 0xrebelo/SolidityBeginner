// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Os modificadores são blocos de código, que podem ser aplicados em funções.
//Os modificadores alteram o comportamento de uma função de forma declarativa.

//Estrutura:
//modifier [nome]([parametros]) {}


contract Modificadores {

//Esta variavel de estado define o dono do contrato (Quem deu deploy do contrato)
    address public dono = msg.sender;

//Esta variavel de estado só pode ser alterada pelo dono do contrato
    uint restrita;

    modifier onlyOwner() {
        require (msg.sender == dono);
        //A função é executada na linha abaixo _;
        _;
    
    }

//O onlyOwner está escrito de uma forma declarativa nesta função
    function setRestrita (uint _valor) public onlyOwner {
       
        restrita = _valor;
    }


}