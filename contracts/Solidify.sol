pragma solidity ^0.4.17;

contract SolidifyMyContract { 
    string myworduno;
    string myworddos;
    uint number;
    address owner;
    
    function SolidifyMyContract(string _myworduno, string _myworddos) public {
        myworduno = _myworduno;
        myworddos = _myworddos;
        number = 42;
        owner = msg.sender;
    }

    event Changed(address a);
    
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
    
    function getWord() public constant returns (string) {
        return myworduno;
    }
    
    function setWord(string newWord) public onlyOwner returns (string) {
        myworduno = newWord;
        Changed(msg.sender);
    }
}