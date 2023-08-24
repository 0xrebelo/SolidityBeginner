// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Encode {

//codificação ABI
    function encode() public pure returns (bytes memory) {
        return abi.encode(3, 9, "Hello World", true);
    } 

    function encodeSignature() public pure returns (bytes memory) {
        return abi.encodeWithSignature("valor(uint256)",58);
    }

    function decode(bytes calldata _valor) public pure returns (uint, uint, string memory, bool){
        return abi.decode(_valor, (uint, uint, string, bool));
    }
}