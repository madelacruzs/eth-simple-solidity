pragma solidity ^0.4.17;

contract Mortal { 
    address public owner;

    //Constructor
    function Mortal() public {
        owner = msg.sender;
    } 

    //Destruye el contrato, jamas se podra usar
    function kill() onlyOwner() public {
        selfdestruct(owner);
    }

    //Unicamente el owner
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
}

//Hereda de Mortal
contract User is Mortal { 
    string public userName;

    function User(string _userName) public {
        userName = _userName;
    } 
}

//Hereda de Mortal
contract Provider is Mortal { 
    string public providerName;

    function Provider(string _providerName) public {
        providerName = _providerName;
    } 
}
