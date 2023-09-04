// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Os modificadores são blocos de código, que podem ser aplicados em funções.
//Os modificadores alteram o comportamento de uma função de forma declarativa.

//Estrutura:
//modifier [nome]([parametros]) {}

//Neste exemplo temos 3 funções (uma para cada status) que apenas funcionam quando o status é igual ao da respetiva função
//Podiamos elaborar o corpo da função, no entanto pretende-se ver apenas o funcionamento do Modificador
//

contract Modificador {

    //Enumerador Status com possibilidade de ser Venda, Aluguer ou Compra de um imóvel
    enum Status {
        Venda,          //valor 0
        Aluguer,        //valor 1
        Compra          //valor 2

    }

    //Variável de estado que guarda o status atual (serve para consultar o valor 0 ou 1)
    //Se não definirmos o status da variável Status esta inicializa como 0 que neste caso corrsponde a Venda
    Status public status;

    //Declarar um modificador 
    modifier ApenasStatus (Status _status) {
        require(status == _status);
        _;
    }
    //Função que só será executada enquanto o status for de venda
    function apenasVenda () public ApenasStatus(Status.Venda){
        //corpo da função
    }
    //Função que só será executada enquanto o status for de aluguer
    function apenasAluguer () public ApenasStatus(Status.Aluguer) {
        //Corpo da função
    }

    //Função que só será executada enquanto o status for de aluguer
    function apenasCompra () public ApenasStatus(Status.Compra) {
        //Corpo da função
    }

    //Função que altera o status do contrato
    function alteraStatus (Status _status) public {
        status = _status;
    }
}