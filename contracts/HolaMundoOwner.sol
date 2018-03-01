pragma solidity ^0.4.17;

contract HelloWordContractOwner { 
    string myword = "Hola Mundo solidity";
    address owner;
    
    function HelloWordContractOwner() public {
        owner = msg.sender;
    }
    
    function getWord() public constant returns (string) {
        return myword;
    }
    
    function setWord(string newWord) public returns (string) {
        if (owner != msg.sender) {
            return "No eres el creador del contract";
        }
        myword = newWord;
        return "Si eres el creador";
    }
}