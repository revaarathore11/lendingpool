// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleLendingPool {

    // How much ETH each user has deposited
    mapping(address => uint256) public deposits;

    // How much ETH each user has borrowed
    mapping(address => uint256) public borrows;

    /*
        -------------------------
        DEPOSIT ETH INTO THE POOL
        -------------------------
        - User sends ETH with the function call
        - We add that amount to their deposit balance
    */
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be more than 0");

        deposits[msg.sender] += msg.value;
    }

    /*
        -------------------------
        WITHDRAW ETH YOU DEPOSITED
        -------------------------
        - User can only withdraw what they deposited
        - Contract checks it has enough ETH to send
    */
    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(deposits[msg.sender] >= amount, "Not enough deposited");
        require(address(this).balance >= amount, "Pool has no money");

        deposits[msg.sender] -= amount;

        payable(msg.sender).transfer(amount);
    }

    /*
        -------------------------
        BORROW ETH FROM THE POOL
        -------------------------
        - User must have at least 50% of the borrowed amount as collateral
          Example: To borrow 1 ETH, user must have 0.5 ETH deposited.
        - Pool must have enough ETH to lend
    */
    function borrow(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(address(this).balance >= amount, "Pool is empty");

        // simple collateral rule: deposit >= half of borrow
        require(deposits[msg.sender] >= amount / 2, "Not enough collateral");

        borrows[msg.sender] += amount;

        payable(msg.sender).transfer(amount);
    }

    /*
        -------------------------
        REPAY BORROWED ETH
        -------------------------
        - User sends ETH to repay loan
        - If they send too much, they get the extra back
    */
    function repay() external payable {
        require(borrows[msg.sender] > 0, "You don't owe anything");
        require(msg.value > 0, "Send ETH to repay");

        uint256 owed = borrows[msg.sender];

        if (msg.value >= owed) {
            // loan fully repaid
            borrows[msg.sender] = 0;

            // send back extra money if user overpaid
            uint256 extra = msg.value - owed;
            if (extra > 0) {
                payable(msg.sender).transfer(extra);
            }
        } else {
            // loan partially repaid
            borrows[msg.sender] -= msg.value;
        }
    }

    /*
        -------------------------
        VIEW POOL BALANCE
        -------------------------
        - Shows how much ETH is currently inside the contract
    */
    function poolBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
