// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HyronNFT is ERC721, Ownable {
    // mapping to keep track of which token has been minted to which address
    mapping(uint => mapping(address => bool)) private mintedTokens;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    // function to mint a new token
    function mint(uint256 tokenId) public {
        // make sure the token has not been minted before
        require(mintedTokens[tokenId][msg.sender] == false, "Token already minted");

        // mint the token to the sender's address
        _safeMint(msg.sender, tokenId);

        // record that the token has been minted to the sender's address
        mintedTokens[tokenId][msg.sender] = true;
    }
}
