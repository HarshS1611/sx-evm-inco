// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Proposal, ProposalStatus } from "../types.sol";
import { IExecutionStrategyErrors } from "./execution-strategies/IExecutionStrategyErrors.sol";

/// @title Execution Strategy Interface
interface IExecutionStrategy is IExecutionStrategyErrors {
    struct EncryptedChoice {
        bytes encryptedData;
        bytes publicKey;
    }

    function execute(
        uint256 proposalId,
        Proposal memory proposal,
        uint256 votesFor,
        uint256 votesAgainst,
        uint256 votesAbstain,
        EncryptedChoice[] calldata encryptedVotes,
        bytes memory payload
    ) external;

    function getProposalStatus(
        Proposal memory proposal,
        uint256 votesFor,
        uint256 votesAgainst,
        uint256 votesAbstain,
        EncryptedChoice[] memory encryptedVotes
    ) external view returns (ProposalStatus);

    function getStrategyType() external view returns (string memory);
}
