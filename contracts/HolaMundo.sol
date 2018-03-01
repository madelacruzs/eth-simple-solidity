pragma solidity ^0.4.17;

contract HelloWordContract { 
    string myword = "Hola Mundo solidity";
    
    //Devuelve la variable
    function getWord() public constant returns (string) {
        return myword;
    }
    
    //Modifica la variable
    function setWord(string newWord) public returns (string) {
        myword = newWord;
        return myword;
    }
}