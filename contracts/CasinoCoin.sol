pragma solidity ^0.4.0;

contract CoinFlip {
    
    //Dueño del contrato
    address owner;
    //Porcentaje de ganancia
    uint payPercentaje = 90;
    
    //Evento para mandar estatus
    event Status(string _msg, address user, uint amount);
    
    //Constructor, payable, va a tener saldo inicial (ver payable.sol)
    //Desde su creacion pueden mandarle Ether, segun lo que desee enviarle el Owner (value)
    function CoinFlip() public payable {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
		if (msg.sender != owner) {
			revert();
		} else {
			_;
		}
	}
    
    //Logica para ganar algo de dinerus!!
    function flipCoin() public payable {
        if ((block.timestamp % 2) == 0) {
            if (this.balance < ((msg.value * payPercentaje) / 100)) {
                Status("Congratulations, You won! Sry, we didnt have enought Money to pay you, we pay you all the remaining balance of this contract", msg.sender, this.balance);
                msg.sender.transfer(this.balance);
            } else {
                msg.sender.transfer(msg.value * (100 + payPercentaje)/100);
                Status("Congratulations, You won!", msg.sender, msg.value * (100 + payPercentaje)/100);
            }
        } else {
            Status("We are sorry, you lose, try Again to recover your money", msg.sender, msg.value);
        }
    }
    
    //Funcion para destruir el contrato, ya no podrà ser usado, pero queda registro
    //Toda la Lana o Balance que tenga el contrato, se enviará al owner
    //Por eso unicamente  lo ejecuta el owner ;)
    function kill() public onlyOwner {
        Status("Contracted Killed, not longer available to use", msg.sender, this.balance);
        selfdestruct(owner);
	}
}