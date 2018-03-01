
pragma solidity ^0.4.17;

contract MyCallerContract { 
    
    MyChildContract toBeCalled = new MyChildContract();

    function getNumber() public constant returns (uint) {
        //Llama al otro contrato
        return toBeCalled.getNumber();
    } 
}

//Esto es otro contrato, puede estar en otro File
contract MyChildContract {
    uint number = 100;

    function getNumber() public constant returns (uint) {
        return number;
    }
}

/*

contract MyCallerContract { 
    
    MyChildContract toBeCalled =  MyChildContract(0xb87213121fb89cbd8b877cb1bb3ff84dd2869cfa);

    function getNumber() public constant returns (uint) {
        //Llama al otro contrato
        return toBeCalled.getNumber();
    } 
}

//Esto es otro contrato, puede estar en otro File
contract MyChildContract {
    uint number = 100;

    function getNumber() public constant returns (uint) {
        return number;
    }
}

 */