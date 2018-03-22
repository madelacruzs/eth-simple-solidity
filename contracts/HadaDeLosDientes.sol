pragma solidity ^0.4.0;

contract ToothFairy {
    
    //Direcciones de el hijo, de la mama y del hada
    address child = 0x249A17f2587b9103A3780D67c9B1C6AFcCBe004F; // Address del hijo
    address mother = 0x18D82F0710e4d70ac8d07a7dEC65f005A4a230AC; // Address de la madre
    address toothFairy;
    
    bool toothPaid = false;
    
    //Enum: Estados de el diente
    enum ToothState { Mouth, WaitingFallenApproval, Fallen }
    
    ToothState public toothState = ToothState.Mouth;
    
    //Constructor
    function ToothFairy() public payable {
        toothFairy = msg.sender;
    }
    
    function toothFall() public onlyChild {
        if (toothState == ToothState.Mouth) {
            toothState = ToothState.WaitingFallenApproval;
        } else {
            revert();
        }
    }
    
    function motherApproves() public onlyMother {
        if (toothState == ToothState.WaitingFallenApproval) {
            toothState = ToothState.Fallen;
            payToChild();
        } else {
            revert();
        }
    }
    
    function payToChild() public {
        if (toothState == ToothState.Fallen && toothPaid == false) {
            child.transfer(this.balance);
            toothPaid = true;
        }
    }
    
    //Modificador: Unicamente el hijo
    modifier onlyChild {
        if (msg.sender != child) {
            revert();
		} else {
            _;
		}
    }
    
    //Modificador: Unicamente el hada
    modifier onlyFairy {
        if (msg.sender != toothFairy) {
            revert();
		} else {
            _;
        }
    }
	
    //Modificador: Unicamente la madre
    modifier onlyMother {
        if (msg.sender != mother) {
            revert();
		} else {
            _;
        }
    }
}