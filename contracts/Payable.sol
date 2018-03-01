pragma solidity ^0.4.17;

contract PayableMyContract { 

    //Constructor    
    function PayableMyContract() public {

    }

    //Recibe los fondos que envia segun el address que lo ejecuta
    //Los fondos se quedan en this contract
    function receiveFounds() public payable {

    }

    //Devuelve el balance de este contracto
    function getBalance() public constant returns (uint) {
       return this.balance;
    }
}
