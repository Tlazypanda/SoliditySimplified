// SPDX-License-Identifier: MIT
// Well the first license line is nothing but us specifying on the license we are using for this contract (read up more on Opensource licenses for more). If you miss this line the solidity compiler will throw a warning

pragma solidity ^0.8.10; // just specifying the version of solidity, the ^ implies it will not work on a compiler starting from version 0.9.0


/*Gm, 
Our first program is going to be a simple Wallet program able to receive payments and funds are withdrawable to the owner. 
Now, it's time for you to create your own version of this wallet, share it with me over twitter (@sneha_bb) or open it as a pull request on Github. 
Be creative frens, how about some variations (maybe a max limit on what you can withdraw like a faucet? or a list of multiple addresses that can withdraw like a multisig wallet?
Feel free to reach out to me @sneha_bb over Twitter for any help with these contracts as well :) 
*/

contract Wallet {
    // payable address can receive ether
    address payable public owner; 

    constructor() {
        owner = payable(msg.sender); //setting the owner to be msg.sender i.e the one who deployed the contract, the payable declaration allows msg.sender to receive ether into contract
    }

    receive() external payable {} //for receiving ether contract must have this function (when msg.data must be empty) or a fallback function (msg.data not empty). 

    function withdraw(uint _amount) external { // to withdraw to our owner
        require(msg.sender == owner, "caller is not owner"); // require checks if owner and caller (msg.sender) is same person or not
        payable(msg.sender).transfer(_amount); // amount is transfered to owner 
    }

    function getBalance() external view returns (uint) { //returns the balance of our contract, `this` represents our contract here
        return address(this).balance;
    }
}
