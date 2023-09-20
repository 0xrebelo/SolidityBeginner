// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


//Um contrato em Solidity é semelhante a uma classe em linguagens de programação orientadas a objetos.
//Ele define a estrutura e o comportamento dos objetos que serão criados a partir dele.

//Contratos podem conter:
/// Variáveis de estado, 
/// Funções 
/// Eventos.


////Variáveis de Estado: 
//Variáveis de estado são declaradas dentro de um contrato
//e representam dados que podem ser armazenados permanentemente na blockchain. 
//Cada instância do contrato terá sua própria cópia dessas variáveis de estado, 
//que podem ser lidas e modificadas por meio de funções do contrato.

///Funções: 
//Funções são os métodos que podem ser chamados em um contrato. 
//Eles podem ser usados para executar lógica, modificar variáveis de estado e interagir com outros contratos ou chamadores externos. 
//As funções podem ser públicas (acessíveis a todos), internas (acessíveis apenas dentro do contrato) ou externas (acessíveis somente por chamadas externas).

///Eventos: 
//Eventos são mecanismos para emitir informações sobre o contrato para os clientes que estão ouvindo.
//Eles são geralmente usados para notificar as partes interessadas sobre a ocorrência de eventos importantes no contrato.

///Instâncias:
//Instâncias de Contrato: Quando você implanta um contrato em uma blockchain (por meio de uma transação de criação de contrato), 
//uma instância desse contrato é criada. Cada instância tem seu próprio estado e endereço na blockchain. 
//Essas instâncias são independentes umas das outras, mas compartilham o mesmo código-fonte (contrato).

///Interagindo com Instâncias: 
//Para interagir com um contrato, você cria uma instância do contrato em seu código
//(ou usa uma instância já implantada) e, em seguida, chama as funções desse contrato por meio dessa instância. 
//Isso permite que você acesse o estado do contrato e execute as operações desejadas.

//Em resumo, em Solidity, classes são chamadas de contratos, e instâncias são cópias independentes desses contratos
//implantados na blockchain. 
//Você pode criar, implantar e interagir com essas instâncias para construir aplicativos descentralizados na Ethereum
//e em outras blockchains compatíveis com contratos inteligentes.


contract Sum {

    function soma(uint x, uint y) public pure returns (uint){
        return x + y;
    }
}


contract Fabrica {

    address[] public enderecos; 

    function criaNovoSoma() public {

        // Criei uma nova instancia do contrato Sum, atraves do new Sum
        Sum novoSoma = new Sum();

        // A partir dessa instancia pegamos no endereço e gravamos no array
        enderecos.push(address(novoSoma));

    }
}