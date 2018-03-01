pragma solidity ^0.4.17;

contract Mortal { 
    address public owner;

    function Mortal() public {
        owner = msg.sender;
    } 

    function kill() onlyOwner() public {
        selfdestruct(owner);
    }

    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert(); 
        } else {
            _;
        }
    }
}

contract User { 
    string public userName;

    function User(string _userName) public {
        userName = _userName;
    } 
}

contract Provider { 
    string public providerName;

    function Provider(string _providerName) public {
        providerName = _providerName;
    } 
}
