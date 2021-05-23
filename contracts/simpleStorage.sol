pragma solidity ^0.4.0; 

contract SimpleStorage {
    
    uint storedData; 
    
    // default state is 0

    function set(uint x) public {
        storedData = x; 
        return; 
    }
    
    function get() constant public returns (uint) {
        return storedData; 
    }
    
    function increment (uint n) public {
        storedData = storedData + n; 
        return; 
    }
    
    function decrement (uint n) public {
        storedData = storedData - n; 
        return; 
    }
}