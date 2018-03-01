pragma solidity ^0.4.17;

contract HelloWordContractOwner { 
    string myword = "Hola Mundo solidity";
    address owner;
    
    function HelloWordContractOwner() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert(); 
        } else {
            _;
        }
    }
    
    function getWord() public constant returns (string) {
        return myword;
    }
    
    function setWord(string newWord) public onlyOwner returns (string) {
        myword = newWord;
        return "Si eres el creador";
    }
}