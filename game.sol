// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenGame {
    mapping(address => uint256) public balanceOf;
    mapping(address => bool) public registeredPlayers;
    address public owner;
    uint256 public rewardAmount;
    uint256 public taskCount;
    mapping(uint256 => Task) public tasks;

    struct Task {
        string description;
        uint256 reward;
        bool completed;
    }

    event TaskSubmitted(address indexed player, uint256 indexed taskId, string proof);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    modifier onlyRegisteredPlayer() {
        require(registeredPlayers[msg.sender], "You need to register before you can play the game");
        _;
    }

    function register() external {
        registeredPlayers[msg.sender] = true;
    }

    function addTask(string calldata description, uint256 reward) external onlyOwner {
        tasks[taskCount] = Task(description, reward, false);
        taskCount++;
    }

    function submitTask(uint256 taskId, string calldata proof) external onlyRegisteredPlayer {
        require(taskId < taskCount, "Invalid task ID");
        Task storage task = tasks[taskId];
        require(!task.completed, "This task has already been completed");
        balanceOf[msg.sender] += task.reward;
        task.completed = true;
        emit TaskSubmitted(msg.sender, taskId, proof);
    }

    function withdraw() external {
        require(balanceOf[msg.sender] > 0, "You have no rewards to withdraw");
        uint256 amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    function setRewardAmount(uint256 amount) external onlyOwner {
        rewardAmount = amount;
    }

    function withdrawRewards() external onlyOwner {
        require(rewardAmount > 0, "There are no rewards to withdraw");
        uint256 amount = rewardAmount;
        rewardAmount = 0;
        payable(owner).transfer(amount);
    }
        
}
