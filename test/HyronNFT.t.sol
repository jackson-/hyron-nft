// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HyronNFT.sol";

contract HyronNFTTest is Test {
    HyronNFT public hyronNFT;

    function setUp() public {
        hyronNFT = new HyronNFT("HyronNFT", "HNFT");
    }
}
