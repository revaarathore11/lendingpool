# lendingpool

🪙 Simple Lending Pool (Beginner-Friendly Solidity Project)

This repository contains a simple and easy-to-understand Ethereum lending pool smart contract.
It serves as a perfect starting point for beginners who want to learn how decentralized lending works at a basic level without complex math, interest rates, or oracles.

The contract was successfully deployed on a testnet, with deployment details included below for transparency and reference.

📘 Project Description

The Simple Lending Pool contract demonstrates core DeFi mechanics such as depositing ETH, borrowing ETH using collateral, repaying loans, and checking pool balance.
It focuses entirely on clarity and beginner accessibility — every function is intentionally straightforward and well-commented.

This project is ideal for:

New Solidity developers

Students exploring blockchain development

Developers experimenting with DeFi fundamentals

Hackathon beginners

Anyone wanting a clean template they can build upon

💡 What It Does

This lending pool allows users to interact with ETH in the following ways:

✔ Deposit ETH

Users can deposit ETH into the lending pool. Deposits update their personal balance inside the contract.

✔ Withdraw ETH

Users can withdraw any ETH they previously deposited, as long as it's not tied up as collateral.

✔ Borrow ETH

Users can borrow ETH from the pool as long as they have at least 50% of the borrowed amount deposited as collateral.

✔ Repay ETH

Users can repay borrowed ETH — and if they send more than required, the contract automatically refunds the extra.

✔ Check Total Pool Balance

A simple function lets anyone check how much ETH is currently inside the smart contract.

🚀 Features

🧩 Super beginner-friendly Solidity code

📝 Clear comments explaining each function

💰 ETH-based lending system (no tokens required)

🔐 Basic collateral model: deposit must be ≥ 50% of borrowing amount

🔄 Auto-refund for extra repayments

⚡ Zero constructor parameters — deploy instantly

🌱 Perfect starter template for DeFi learners

🔗 Deployed Smart Contract Link

Contract Address: XXX

(Keep the placeholder or replace it with your actual deployed contract address.)

📦 Testnet Deployment Details (for reference)
Transaction Hash: 0xb4ab0610e4b40b37513f85d35a6e2094c762b341d0f07036eb12310059b50403  
Status: Confirmed  
Block: 24442617  
Timestamp: Nov 27 2025  
From: 0x697ce977C4f8Ca3F5d2C872d9BeA8aDf20aA14d5  
Contract Created At: 0x78278A29102364d6affE3dff4c0fc486a5A4063E  
Gas Used: 379,049  
Network Token: C2FLR (Testnet)  

📄 Smart Contract Code
//paste your code

🧪 How to Run This in Remix

Visit https://remix.ethereum.org

Create a new file: SimpleLendingPool.sol

Paste the contract code

Compile using Solidity 0.8.20 or later

Deploy the contract (no constructor inputs needed)

Use the buttons in Remix to:

deposit() — send ETH

withdraw(amount)

borrow(amount)

repay() — send ETH with your repayment

poolBalance()

📜 License

Licensed under the MIT License, meaning you are free to modify, reuse, or expand this project however you like.
