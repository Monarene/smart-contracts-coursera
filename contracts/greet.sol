pragma solidity ^0.4.0;

contract Greeter {
     
    string public yourName; 
    
    constructor() public {
        yourName = "World"; 
    }
    
    function set(string name) public {
        yourName = name; 
    }
    
    function hello() public returns(string) {
        return yourName; 
    }
}

