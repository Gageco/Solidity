pragma solidity ^0.4.11;

//quick note functions in contracts with the same name are done first and only once

contract mortal {
  address owner;

  function mortal() {
    owner = msg.sender;
  }

  function kill() {
    if (msg.sender != owner) {
      throw;
    }
    else {
      selfdestruct(owner);       //kill the whole contract, special word i guess
    }
  }
}

contract MyToken is mortal {
  mapping (address => uint256) public balanceOf;

  string public name;
  string public symbol;
  uint8 public decimal;

  event Transfer(address indexed from, address indexed to, uint256 indexed value);

  function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 tokenDecimal) {
    balanceOf[msg.sender] = initialSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimal = tokenDecimal;
  }

  function transFer(address _to, uint256 amount) {      //this is a captical F because I want to see how the function names are created, like it breaks them up somehow and I want to see if it is at the capital letters. Ill report back once I deploy this on the chain
    if (balanceOf[_to] < amount || balanceOf[msg.sender] + amount <= balanceOf[msg.sender]) {
      throw;
    }
    else {
      balanceOf[msg.sender] -= amount;
      balanceOf[_to] += amount;
    }
    Transfer(msg.sender, _to, amount);
  }

}
