pragma solidity ^0.4.0; 

contract Bidder {
    
    string public name  = "Buffalo"; 
    uint public bidAmount; 
    bool public eligible; 
    uint constant minBid = 300; 
    
    function setName(string num) public {
        name = num; 
    }
    
    function setBidAmount(uint x) public {
        bidAmount = x; 
    }
    
    function determineEligibility() public {
        if (bidAmount >= minBid) eligible = true; 
        else eligible = false; 
    }
    
    function returnName() constant public returns (string) {
        return name; 
    }
    
}