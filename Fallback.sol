// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//A função RECEIVE apenas é executada se o payload for vazio (esta função é opcional e precisa de ser payable)

//A função FALLBACK é executada: 
//1-se o payload for vazio (e não exista função receive)
//2-se o payload for incompativel com qualquer função existente

//Tanto a função FALLBACK como RECEIVE tÊm de ser externaL 
//porque não pode ser executada dentro do contrato, apenas podem ser chamadas de fora do contrato
//por exemplo: EOAs ou outros contratos


contract Fallback {

    uint public dinheiro;

    receive() external payable{
        dinheiro = dinheiro + msg.value;
    }

    fallback(bytes calldata) external payable returns (bytes memory) {
        return bytes("Hello!");
    }

//Se enviarmos em calldata uma assinatura/payload do keccak-256 da função foo()
//input = foo()
//output = c2985578b8f3b75f7dc66a767be2a4ef7d7c2224896a1c86e92ccf30bae678b7
//calldata/payload = 0xc2985578b8f3b75f7dc66a767be2a4ef7d7c2224896a1c86e92ccf30bae678b7
//O contrato irá executar a função foo() e retornar 12
    function foo() public pure returns(uint) {
        return 12;
    }

}