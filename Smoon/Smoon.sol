// Current Version of solidity
pragma solidity ^0.8.2;

// Main coin information
contract Token {
    // Initialize addresses mapping
    mapping(address => uint) public balances;
    // The total supply
    uint public totalSupply = 1000 * 10 ** 18;
    // The tokens anme
    string public name = "Smoon";
    // The token symbol
    string public symbol = "SMO";
    // Total Decimals 
    uint public decimals = 18;
    
    // Transfers
    event Transfer(address indexed from, address indexed to, uint value);
    
    // Executed once i.e. deploying contract
    constructor() {
        // Sending all tokens to the owner
        balances[msg.sender] = totalSupply;
    }
    
    // Check the balance
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    // Transfering tokens
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'Insufficient balance');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
}