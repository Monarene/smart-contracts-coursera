pragma solidity ^0.4.0;

contract Ballot {
    
    struct Voter {
        uint256 weight;
        bool voted;
        uint256  vote; 
    }
    
    struct Proposal {
        uint256 voteCount; 
    }
    
    address chairperson; 
    mapping(address => Voter) voters; 
    Proposal[] proposals; 
    
    constructor(uint8 _numOfProposals) public {
        chairperson = msg.sender; 
        voters[chairperson].weight = 2; 
        proposals.length = _numOfProposals; 
    }
    
    function register(address toVoter) public {
        if(msg.sender!= chairperson || voters[toVoter].voted) return; 
        voters[toVoter].weight = 1; 
        voters[toVoter].voted = false; 
    }
    
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender]; 
        if (sender.voted || toProposal >= proposals.length) return; 
        sender.voted = true; 
        sender.vote = toProposal; 
        proposals[toProposal].voteCount += sender.weight; 
    }
    
    function winningProposal() public constant returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0; 
        for (uint8 prop = 0; prop < proposals.length; prop++) 
        if (proposals[prop].voteCount > _winningProposal) {
            winningVoteCount = proposals[prop].voteCount; 
            _winningProposal = prop; 
        }
    }
    
}