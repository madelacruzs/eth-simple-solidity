pragma solidity ^0.4.0;

contract BlackList {

    struct Person {
        address adr;
        int count;
    }

    mapping(address => Person) public aBlackList;
	
    function BlackList() public {
		
    }	

    function addToBlackList(address _address) public {
        aBlackList[_address].adr = _address;
        aBlackList[_address].count += 1;
    }
}