pragma solidity ^0.4.0;

contract HeredarEthersaMisHijos {
    
    //Dueño del contrato
    address owner;
    
    // Ultima vez que se hizo ping a este contrato
    uint256 public lastTouch;
    
    //Mis Hijos
    address[] public childs;
    
    event Status(string _msg, address user, uint256 time);
    
    // Se crea el contrato y se manda un balance (Ether de el campo value)
    //Se asigna el owner y la ultima vez que se hizo ping
    function HeredarEthersaMisHijos() public payable {
        owner = msg.sender;
        lastTouch = block.timestamp;
        Status("Last Will Created", msg.sender, block.timestamp);
    }
    
    //Se deposita fondos a este contrato
    function depositFunds() public payable {
        Status("Funds Deposited", msg.sender, block.timestamp);
    }
    
    //Se actualiza el contrato, unicamente el owner, se marca
    // para decirle al contrato que sigo vivo
    function stillAlive() public onlyOwner {
        lastTouch = block.timestamp;
        Status("I Am Still Alive!", msg.sender, block.timestamp);
    }
    

    // Alguien pregunta si estoy vivo
    // Supongamos que no he hecho ping hace 60 segundos
    // Entonces, mis hijos se quedan con mi lana :(
    function isDead() public {
        Status("Asking if dead", msg.sender, block.timestamp);
        if (block.timestamp > (lastTouch + 60)) {
            giveMoneyToChilds();
        } else {
            Status("I Am still Alive!", msg.sender, block.timestamp);
        }
    }
    
    //Aqui es la funcion en donde se manda la Lana (balance) de el contrato
    //Unicamente a los hijos que yo di de alta
    function giveMoneyToChilds() public {
        Status("I am dead, take my money", msg.sender, block.timestamp);
        uint amountPerChild = this.balance/childs.length;
        for (uint i = 0; i < childs.length; i++) {
            childs[i].transfer(amountPerChild);
        }
    }
    
    //Agrego a mis herederos
    function addChild(address _address) public onlyOwner {
        Status("Child Added", _address, block.timestamp);
        childs.push(_address);
    }
    
    modifier onlyOwner {
		if (msg.sender != owner) {
			revert();
		} else {
			_;
		}
	}
}