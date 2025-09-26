// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The smart contract for the Decentralized Ballot system
contract DecentralizedBallot {
    // Total number of votes cast
    uint256 private totalVotes;
    
    // Tracks which addresses have voted to prevent double-voting
    mapping(address => bool) private hasVoted;

    // Core Function 1: Allows an address to cast a vote
    function castVote() public {
        // Ensure the sender hasn't voted yet
        require(!hasVoted[msg.sender], "You have already cast your vote.");
        
        // Record the vote and mark the sender as having voted
        totalVotes++;
        hasVoted[msg.sender] = true;
    }

    // Core Function 2: Retrieves the current total vote count
    function getTotalVotes() public view returns (uint256) {
        return totalVotes;
    }

    // Core Function 3: Checks if an address has voted
    function checkVotedStatus(address _voter) public view returns (bool) {
        return hasVoted[_voter];
    }
}
