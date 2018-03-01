pragma solidity ^0.4.17;

contract Functions { 
    string public text = "";
    int public numberOfChanges = 0;

    //Funcion Publica
    function changeToHello() public {
        numberOfChanges += 1;
        text = "Hola Mundo";
    }

    //Funcion Publica, llama a una funcion privada
    function callToPrivateFunction() public {
         changeToHelloBye();
    }

    //Funcion Privada (esto no se ve desde el cliente front-end)
    function changeToHelloBye() private {
        numberOfChanges += 1;
        text = "Hola y Bye";
    }
}