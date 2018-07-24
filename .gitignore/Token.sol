pragma solidity ^0.4.20;

contract Token {
    string  name="Litecoins";
    string  symbol="#";
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
  event Transfer(address indexed from, address indexed to, uint256 value);
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Token(uint256 initialSupply) public  {
          // Give the creator all initial tokens
        balanceOf[msg.sender] = initialSupply;            
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        return true;
         /* Notify anyone listening that the transfer took place */
        Transfer(msg.sender, _to, _value);
    }
}
