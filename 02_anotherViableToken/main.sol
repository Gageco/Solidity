pragma solidity ^0.4.11

event Transfer(address indexed from, address indexed to, uint256 value);

contract MyToken{
  mapping (address => uint256) public balanceOf;                                //map amount of coin to addresses

  string public name;
  string public symbol;
  uint8 public decimals;

  function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol) {                                             //give initialSupply to person who creates contract, name has to be the same as start function
    balanceOf(msg.sender) = initialSupply;                                      //will be given in compiler
    name = tokenName;
    symbol = tokenSymbol;
  }

  //Send Coins
  function transfer(address _to, uint256 _value) {
    //move coins from '_from 'to '_to'
    if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to]) {
      throw;
    }
    else {
      balanceOf[msg.sender] -= _value;
      balanceOf[_to] += _value;
    }

    //Notify people of Transfer
    Transfer(msg.sender, _to, _value);
  }


}
