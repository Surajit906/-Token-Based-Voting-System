// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract TokenBasedVoting {
    IERC20 public votingToken;
    address public owner;

    struct Proposal {
        string description;
        uint256 voteFor;
        uint256 voteAgainst;
        uint256 deadline;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    Proposal[] public proposals;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    constructor(address _tokenAddress) {
        votingToken = IERC20(_tokenAddress);
        owner = msg.sender;
    }

    function createProposal(string calldata _description, uint256 _durationInSeconds) external onlyOwner {
        Proposal storage newProposal = proposals.push();
        newProposal.description = _description;
        newProposal.deadline = block.timestamp + _durationInSeconds;
    }

    function vote(uint256 proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];
        require(block.timestamp < proposal.deadline, "Voting period over");
        require(!proposal.hasVoted[msg.sender], "Already voted");

        uint256 weight = votingToken.balanceOf(msg.sender);
        require(weight > 0, "No voting power");

        if (support) {
            proposal.voteFor += weight;
        } else {
            proposal.voteAgainst += weight;
        }

        proposal.hasVoted[msg.sender] = true;
    }

    function getProposal(uint256 proposalId) external view returns (
        string memory description,
        uint256 voteFor,
        uint256 voteAgainst,
        uint256 deadline,
        bool executed
    ) {
        Proposal storage p = proposals[proposalId];
        return (p.description, p.voteFor, p.voteAgainst, p.deadline, p.executed);
    }

    function getProposalCount() external view returns (uint256) {
        return proposals.length;
    }

    function hasVoted(uint256 proposalId, address voter) external view returns (bool) {
        return proposals[proposalId].hasVoted[voter];
    }
}
