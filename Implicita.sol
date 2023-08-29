// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Implicita {

//conversão implicita - passamos de uint8 (que vai até 255) para uint16 (que vai até 65535)
//Não se perdem dados

    function converte() public pure returns (uint16){
        uint8 pequeno = 100;
        uint16 medio = pequeno;
        return medio;
    }

//conversão implicita - passamos de bytes1 para bytes2 
//Não se perdem dados
     function converte1() public pure returns (bytes2){
        bytes1 pequeno = 0x36;
        bytes2 medio = pequeno;
        return medio;
    }

//conversão implicita - passamos de uint8 (que vai até 255) para uint16 (que vai até 65535)
//Não se perdem dados
    function converte2() public pure returns (uint16){
        uint8 pequeno = 100;
        uint16 medio = 10000;
        uint16 soma = pequeno + medio;
        return soma;
    }
}