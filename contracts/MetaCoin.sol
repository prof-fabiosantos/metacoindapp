pragma solidity >=0.4.25 <0.6.0;

import "./ConvertDol.sol";

contract MetaCoin {
	mapping (address => uint) saldos;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() public {
		saldos[tx.origin] = 10000;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (saldos[msg.sender] < amount) 
		    return false;
		saldos[msg.sender] -= amount;
		saldos[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

   	function getSaldo(address addr) public view returns(uint) {
		return saldos[addr];
	}
	
	function getBalanceInDlar(address addr) public view returns(uint){
		return ConvertDol.convert(getSaldo(addr),2);
	}
}