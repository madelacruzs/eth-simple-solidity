
pragma solidity ^0.4.17;

contract Calculator { 
    
    Math math = new Math();

    function sumarDosyCuatro() public constant returns (int) {
       return math.add(2,4);
    }

    function multiplicaDosyCuatro() public constant returns (int) {
       return math.multiply(2,4);
    }
}

//Esto es otro contrato, puede estar en otro File
contract Math {

    function add(int a, int b) public pure returns (int) {
        return a + b;
    }

    function multiply(int a, int b) public pure returns (int) {
        return a * b;
    }
}