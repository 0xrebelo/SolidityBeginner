// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


//GÁS

//Taxa de gás - Unidade Computacional- Paga em ETHER
//Taxa de gás = Valor do gás * gás utilizado

//O valor do gás é pago em gwei e quem define o seu valor é o congestionamento da rede

//Sempre que se transfer ETHER é necessario pagar uma taxa de gás
//Cada operação computacional na rede da ETHEREUM está associado a um valor de gás
//(Há função que requerem mais gas que outras dependendo da sua complexidade de execução)


//Após a atualização LONDON na rede ETHEREUM:
//A taxa total é calculada da seguinte forma:

////Unidades de gás usadas * (taxa base + taxa de prioridade) 

//Taxa base é um valor definido pelo protocolo (é queimada na totalidade)
//Taxa de Prioridade é um valor definido pelo usuário como uma gorjeta para o validador.

//No YELLOW PAPER do ETHEREUM estão definidos todos os valores de gas para cada função existente


contract Gas {

    uint number;
    uint[] dinamica;

    function steNumber(uint _number) public returns (uint, uint) {
    //a função gasleft mostra o gas no momento
    //O gasleft antes mostra no output da transação quanto gas havia antes de trocar o valor 0 pra outro valor
        uint antes = gasleft();
        number = _number;
    //O gasleft depois mostra no output da transação quanto gas havia depois de trocar o valor 0 pra outro valor
        uint depois = gasleft();
        return (antes, depois);
    }

    function colocaValores() public {
    //Os ciclos for, while, ... consomem muito gas.
    //Este é um exemplo disso
        for (uint i=0; i<100; i++){
            dinamica.push(i);
        }
    }
}