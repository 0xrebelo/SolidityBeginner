// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Explicita {

//A conversão terá de ser explicita pois há possibilidade de se perderem dados pois passamos de um
//dominio grande para um mais pequeno (exemplo uint16 para uint8)

    function converte() public pure returns (uint8){

        //representação do numero -1 em int8 = 11111111
        int8 numero = -1;
        //conversão explicita do numero int8 para uint8 
        uint8 numeroPositivo = uint8(numero);
        //O retorno do uint8 de 11111111 será 255
        return numeroPositivo;
    }

    function converte1() public pure returns (uint8){

        //representação do numero 6543 em int16 = 0001100110001111
        uint16 numero = 6543;
        //conversão explicita do numero int16 para uint8
        //Só cabem 8 bits então o numero 0001100110001111 fica 10001111
        uint8 numeroPositivo = uint8(numero);
        //O retorno do uint8 de 10001111 será 143
        return numeroPositivo;
    }
}