pragma solidity ^0.4.17;

contract PayCheck { 

    // Lista de direcciones de los empleados
    address[] employees = [0x00ca35b7d915458ef540ade6068dfe2f44e8fa733c, 0x0014723a09acff6d2a60dcdf7aa4aff308fddc160c, 0x004b0897b0513fdc7c541b6d9d7e929c4e5364d2db, 0x00583031d1113ad414f02576bd6afabfb302140225, 0x00dd870fa1b7c4700f2bd7f44238821c26f7392148];
   
    uint totalReceived = 0;

    mapping (address => uint ) withdrawnAmounts;

    function withdraw() public canWithDraw {
        uint amountAllocated = totalReceived/employees.length;
        uint amountWithdrawn = withdrawnAmounts[msg.sender];
        uint amount = amountAllocated - amountWithdrawn;
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount;
        if (amount > 0) {
            msg.sender.transfer(amount);
        }        
    }

    function PayCheck() public payable {
        updateTotal();
    }

    function () public payable {
        updateTotal();
    }

    function updateTotal() internal {
        totalReceived += msg.value;
    }

    modifier canWithDraw() {
        bool contains = false;
        for (uint index = 0; index < employees.length; index++) {
            if (employees[index] == msg.sender) {
                contains = true;
            } 
        }
        require(contains);
        _;
    }

}
