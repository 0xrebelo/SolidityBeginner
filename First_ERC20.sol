// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


/*//////////////////////////////////////////////////////////////////////////////////////
                                        CONTEXT                                   
//////////////////////////////////////////////////////////////////////////////////////*/

// A Ana criou um Token chamado CRYPTO_TOKEN com o simbolo CRP.
// No momento do deploy ela definiu o totalSupply e recebeu-o na totalidade na sua carteira (definir no construtor = xxxx tokens).

////_balance:
//Ana => xxxx tokens
//mapping ( address(Ana) or address(msg.sender) => uint256(totalSupply) ) _balance

//A Ana quer dar permissão a três amigos (Bob, Zoe, Peter) para poderem transferir alguns tokens dela:

////_allowance:
// Ana => [Bob Zoe Peter] => [20 40 15]
//Mapping(address(Ana) => Mapping ( address(Bob Zoe Peter) => uint256 (20 40 15) ) _allowance

//A Ana dá permissão que o Bob possa transferir até 20 tokens dela
//A Ana dá permissão que o Zoe possa transferir até 40 tokens dela
//A Ana dá permissão que o Peter possa transferir até 15 tokens dela


contract MyToken {

    string _name = "Porquinho";
    string _symbol = "SOL";
    uint8 _decimals = 8;
    uint256 _totalSupply;
    //Estrutura de dados que permite armazenar o numero de tokens para cada endereço
    mapping (address => uint) _balance;
    mapping (address => mapping (address => uint256)) _allowance;


/*//////////////////////////////////////////////////////////////////////////////////////
                                        EVENTS                                   
//////////////////////////////////////////////////////////////////////////////////////*/

//Sempre que se executa uma função de transfer => deve ser feito um evento transfer

    event Transfer(address indexed _from, address indexed _to, uint256 _value);


//Sempre que se executa uma função de transfer => deve ser feito um evento transfer

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


/*//////////////////////////////////////////////////////////////////////////////////////////////
                                        STORAGE
//////////////////////////////////////////////////////////////////////////////////////////////*/

//Dentro da função constructor estão as premissas que são executadas no momento do deploy do contrato
    constructor(uint _initialSupply) {
        
//Podemos definir logo o valor do Supply => _totalSupply = 100_000 * 10 ** _decimals
        _totalSupply = _initialSupply;

//Para simplificar a distribuição de tokens, o totalSupply vai para quem deu deploy no contrato [msg.sender]
        _balance[msg.sender] = _totalSupply;
    }


/*/////////////////////////////////////////////////////////////////////////////////////
                                PUBLIC/EXTERNAL FUNCTIONS
/////////////////////////////////////////////////////////////////////////////////////*/

    function name() public view returns (string memory ){
        return _name;
    }

    function symbol() public view returns (string memory){
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint) {
        return _balance[_owner];
    }

    //A função transfer vai receber dois parametros como inputs: 
    //o address _to para onde vão os tokens;
    //o uint _value que é o valor a transferir
    //Será public e vai retornar um booliano que vai dizer se houve ou não sucesso na transação.  

    function transfer(address _to, uint _value) public returns (bool){
        
        //Este require não é necessário pois o balance definido no mapping é um uint
        //Uint só aceita numeros positivos, logo nunca podemos transferir mais do que aquilo que temos
        //Ou seja, _value nunca pode ser maior que _balance[msg.sender], caso contrario revert a transação
        require(_balance[msg.sender] >= _value, "Saldo Insuficiente");
       
        _balance[msg.sender] = _balance[msg.sender] - _value;
        _balance[_to] = _balance[_to] + _value;

        //Emitir um evento de Transfer
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint value) public returns (bool){
        
        //É requerido que o balance da account _from seja maior que o valor que pretendemos transferir
        require(_balance[_from] >= value, "Saldo Insuficiente");

        //msg.sender é quem foi permitido de transferir tokens da conta _from
        //_from é aquele que deu pemissão para um certo endereço poder transferir
        /////Se não existisse este require, alguem poderia transferir maliciosamente os tokens da ANA para outro endereço
        require (allowance(_from, msg.sender) >= value, unicode"Não há permissão");

        _balance[_from] = _balance[_from] - value;
        _balance[_to] = _balance[_to] + value;

        emit Transfer(_from, _to, value);

        //É necessario atualizar o valor do allowance depois de enviar os tokens
        _allowance[_from][msg.sender] = _allowance[_from][msg.sender] - value;

        return true;
    }

//Estamos a dar autorização a um certo _spender para transferir um certo valor de tokens do _owner
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
       
        //Recebendo os endereços do owner e do _spender vai retornar o valor autorizado a transferir pelo _spender.
        return _allowance[_owner][_spender]; 
    }

//Neste caso o msg.sender que é o owner está a aprovar um certo _spender a poder transferir um certo _value dos seus tokens.
    function approve(address _spender, uint256 _value ) public returns (bool){
        

        //Recebendo os endereços do msg.sender e do _spender vai retornar o valor aprovado a transferir pelo _spender.
        _allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
}


