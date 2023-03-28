// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HyronNFT.sol";

contract MyERC1155NFTTest is Test {
    HyronNFT public hyronNFT;

    function setUp() public {
        hyronNFT = new HyronNFT();
    }

    function test_mintToken() public {
        uint256 tokenId = 1;
        uint256 amount = 1;
        hyronNFT.mint(tokenId, amount);
        uint256 balance = hyronNFT.balanceOf(msg.sender, tokenId);
        assertEq(balance, amount);
    }

    function test_mintToken_twice() public {
        uint256 tokenId = 1;
        uint256 amount = 1;
        hyronNFT.mint(tokenId, amount);
        bool result = address(hyronNFT).call(abi.encodeWithSignature("mint(uint256,uint256)", tokenId, amount));
        assertEq(result, false);
    }
}
