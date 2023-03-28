// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC1155Token is ERC1155, Ownable {
    // mapping to keep track of which token ID has been minted to which address
    mapping(uint256 => mapping(address => bool)) private _mintedTokens;

    constructor(string memory uri) ERC1155(uri) {}

    // function to mint a new token
    function mint(uint256 id, uint256 amount, bytes memory data) public {
        // make sure the token ID has not been minted before to the account
        require(_mintedTokens[id][msg.sender] == false, "Token already minted");

        // mint the token to the account
        _mint(account, id, amount, data);

        // record that the token ID has been minted to the account
        _mintedTokens[id][msg.sender] = true;
    }
}
