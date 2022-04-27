pragma solidity >=0.4.25 <0.6.0;

library ConvertDol{
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}