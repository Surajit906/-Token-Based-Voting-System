# 🗳️ Token-Based Voting System

A Solidity smart contract that enables decentralized governance using ERC-20 tokens. Token holders vote on proposals with power proportional to their token balance, allowing for fair and transparent decision-making in communities or DAOs.

---

## 📌 Features

- ✅ Token-weighted voting (based on ERC-20 balances)
- ✅ One vote per address per proposal
- ✅ Simple "For" or "Against" voting
- ✅ On-chain proposal tracking
- ✅ Transparent and immutable results
- ✅ Easy integration with any ERC-20 token

---

## 🧱 How It Works

1. **Contract Owner** creates a proposal with a description and a deadline.
2. **Token Holders** vote once per proposal using their current token balance as voting power.
3. Votes are recorded and stored on-chain.
4. After the deadline, anyone can query the vote result (number of votes "for" vs. "against").

---

## 🛠️ Technologies Used

- **Solidity** ^0.8.0
- **ERC-20 Token Standard**
- Compatible with:
  - [Remix IDE](https://remix.ethereum.org/)
  - [Hardhat](https://hardhat.org/)
  - [Truffle](https://trufflesuite.com/)

---

## 🚀 Getting Started

### Prerequisites

- Node.js
- MetaMask or any Ethereum wallet
- Testnet ETH (for deployment on test networks)
- Hardhat / Truffle / Remix (for development)

### Deployment (Using Remix)

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Paste the smart contract code.
3. Deploy the contract by passing the address of your ERC-20 token.
4. Interact with the contract to create proposals and vote.

---

## 🧪 Example Transaction

- ✅ **Proposal Created / Voted**  
  [`0xf36934509b2e4c4da156555d7abb522f2d864273cda81b34c2c9784837e443c6`](https://etherscan.io/tx/0xf36934509b2e4c4da156555d7abb522f2d864273cda81b34c2c9784837e443c6)

Use `getProposal(0)` to check current vote status (view function, no transaction hash).

---

## 📄 License

This project is licensed under the MIT License.

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change or add.

---

## 🙌 Acknowledgements

- Ethereum Community
- OpenZeppelin for ERC-20 standards
- Chainlink (optional: for randomness or oracles in advanced features)

![Screenshot 2025-05-26 142141](https://github.com/user-attachments/assets/686f0a63-1071-4b62-aaa9-1bd8d4af8fc0)
