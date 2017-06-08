pragma solidity ^0.4.11;

contract owned {              //this is what allows for a centralized control, you apply it to a token contract as shown in MyToken
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract MyToken is owned {
  mapping (address => uint256) public balanceOf;

  //some of the public stuff
  string public name;
  string public symbol;
  uint8 public decimals;
  uint256 public totalSupply;           //setting a total supply that can change

  event Transfer(address indexed from, address indexed to, uint256 value);      //showing when it happens

  function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 tokenDecimals) {
    //setting the public member things
    totalSupply = initialSupply;      //fist you got to set totalSupply to the initialSupply
    balanceOf[msg.sender] = initialSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimals = tokenDecimals;
  }

  function transfer(address _to, uint256 _value) {
    if(balanceOf[msg.sender] < _value || balanceOf[_to] + _value < _value) {
      throw;
    }
    else {
      balanceOf[msg.sender] -= _value;
      balanceOf[_to] += _value;
    }
    //notify of the event
    Transfer(msg.sender, _to, _value);
  }

  function mintToken(address target, uint256 mintAmount) onlyOwner {        //the function responsible for the creation of new tokens
    balanceOf[target] += mintAmount;
    totalSupply += mintAmount;
    Transfer(0, owner, mintAmount);      //from the ether came the tokens, the tokens then went to the owner
    Transfer(owner, target, mintAmount); //and the owner transfered them to the target
    //not really, they were just given to the target account but the owner created them
  }

}
