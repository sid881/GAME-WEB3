# GAME-WEB3

TokenGame Smart Contract
The TokenGame is a smart contract that rewards players for completing tasks or challenges with Ethereum (ETH) or other tokens. Players can register with the contract, and once registered, they can view a list of available tasks and their rewards. They can then complete a task and submit proof of completion to the contract. If the proof is valid, the player will receive the reward.

Features
Players can register with the contract.
The contract owner can add new tasks with different rewards.
Players can complete tasks and submit proof of completion.
If the proof is valid, the player will receive the reward.
Players can withdraw their rewards.
The contract owner can withdraw the total reward amount.
Smart Contract Details
The smart contract is written in Solidity, a programming language used for creating smart contracts on the Ethereum blockchain. The contract includes the following variables and functions:

Variables
balanceOf: A mapping of addresses to their reward balance.
registeredPlayers: A mapping of addresses to their registration status.
owner: The address of the contract owner.
rewardAmount: The total reward amount available for withdrawal by the contract owner.
taskCount: The total number of tasks added by the contract owner.
tasks: A mapping of task IDs to task details.
Functions
register(): Allows a player to register with the contract.
addTask(string calldata description, uint256 reward): Allows the contract owner to add a new task with a description and reward.
submitTask(uint256 taskId, string calldata proof): Allows a registered player to submit proof of completion for a task.
withdraw(): Allows a player to withdraw their rewards.
setRewardAmount(uint256 amount): Allows the contract owner to set the total reward amount available for withdrawal.
withdrawRewards(): Allows the contract owner to withdraw the total reward amount.
License
This smart contract is licensed under the MIT License.
