pragma solidity ^0.4.11;

contract mortal {
  address public owner;

  function mortal() {
    owner = msg.sender;
  }

  function kill() {
    if (msg.sender != owner) {
      throw;
    }

    else {
      selfdestruct(owner);
    }
  }
}

contract MyToken is mortal {
  mapping (address => uint256) public balanceOf;

  event Transfer(address indexed from, address indexed to, uint256 indexed value);

  string public name;
  string public symbol;
  uint8 public decimals;

  function MyToken(uint256 initSupply, string tokenName, string tokenSymbol, uint8 tokenDecimals) {
    balanceOf[msg.sender] = initSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimals = tokenDecimals;
  }

  function transfer(address _to, uint256 _amount) {
    if (balanceOf[msg.sender] < _amount || balanceOf[_to] + _amount <= _amount) {
      throw;
    }
    else {
      balanceOf[msg.sender] -= _amount;
      balanceOf[_to] += _amount;
    }
    Transfer(msg.sender, _to, _amount);
  }
}
