// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import "../interfaces/IVotingStrategy.sol";

contract VanillaVotingStrategy is IVotingStrategy {
    function getVotingPower(
        uint32 /* timestamp */,
        address /* voterAddress */,
        bytes calldata /* params */,
        bytes calldata /* userParams */
    ) external pure override returns (uint256) {
        return 1;
    }
}