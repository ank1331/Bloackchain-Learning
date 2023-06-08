// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

error Raffle_notenoughethentered();
error Raffle_TransferedFailed();
error Raffle_NotOpen();
error Raffle_UpkeepNotNeeded(uint256 currentBalance, uint256 numPlayers, uint256 raffleState);

abstract contract Raffle is VRFConsumerBaseV2, KeeperCompatibleInterface{
    enum RaffleState{
        OPEN,
        CALCULATING
    }// yeh basically 2 state batata hai, 0 is OPEN and 1 is calculating

    /*State Variables*/
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    bytes32 private immutable i_gasLane;
    uint64 private immutable i_subscriptionId;
    uint16 private constant REQUEST_CONFIRMATION = 3;
    uint32 private immutable i_callbackGasLimit;
    uint32 private constant NUM_WORDS = 1;

    event Raffleenter(address indexed player);
    event RequestRaffleWinner(uint256 indexed requesId);
    event WinnerPicked(address indexed winner);


    address private s_recentWinner;
    RaffleState private s_raffleState;
    uint256 private s_lastTimeStamp;
    uint256 private immutable i_interval;

    constructor(
        address VRFCoordinatorV2,
        uint256 entranceFee,
        bytes32 gasLane,
        uint64 subscriptionId,
        uint32 callbackGasLimit,
        uint256 interval
    ) VRFConsumerBaseV2(VRFCoordinatorV2) {
        i_entranceFee = entranceFee;
        i_vrfCoordinator = VRFCoordinatorV2Interface(VRFCoordinatorV2);
        i_gasLane = gasLane;
        i_subscriptionId = subscriptionId;
        i_callbackGasLimit = callbackGasLimit;
        s_raffleState  = RaffleState.OPEN;
        s_lastTimeStamp = block.timestamp;
        i_interval = interval;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle_notenoughethentered();
        }
        if(s_raffleState != RaffleState.OPEN){
            revert Raffle_NotOpen();
        }
        s_players.push(payable(msg.sender));
        emit Raffleenter(msg.sender);
    }

    function checkUpKeep(bytes memory /*checkData*/) public returns(bool upkeepNeeded, bytes memory /*performData*/){
        bool isOpen = (RaffleState.OPEN==s_raffleState);
        bool timePassed = ((block.timestamp - s_lastTimeStamp)>i_interval);
        bool hasPlayers = (s_players.length >0);
        bool hasBalance = address(this).balance >0;
        upkeepNeeded = (isOpen && timePassed && hasPlayers && hasBalance);
    }

    function performUpkeep(bytes calldata /*performData*/) external override {
        // request random number
        // do something with the number
        (bool upkeepNeeded, ) = checkUpKeep(bytes(" "));


        if(!upkeepNeeded){
            revert Raffle_UpkeepNotNeeded(address(this).balance, s_players.length, uint256(s_raffleState));
        }
        s_raffleState = RaffleState.CALCULATING;
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            i_gasLane,
            i_subscriptionId,
            REQUEST_CONFIRMATION,
            i_callbackGasLimit,
            NUM_WORDS
        );
        emit RequestRaffleWinner(requestId);
    }

    function fulfillRandomWords(
        uint256 /*requestId*/,
        uint256[] memory randomWords
    ) internal override {
        uint256 indexOfWinner = randomWords[0]%s_players.length;
        address payable recentWinner = s_players[indexOfWinner];
        s_recentWinner = recentWinner;
        s_raffleState=RaffleState.OPEN;
        s_players = new address payable[](0);
        s_lastTimeStamp = block.timestamp;
        // abb isko paise dena hai sare
        (bool success, ) = recentWinner.call{value: address(this).balance}("");

        if(!success){
            revert Raffle_TransferedFailed();
        }

        emit WinnerPicked(recentWinner);


    }

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }

    function getRecentWinner() public view returns(address){
        return s_recentWinner;
    }

    function getRaffleState() public view returns(RaffleState){
        return s_raffleState;
    }

    function getNumberofPlayers() public view returns(uint256){
        return s_players.length;
    }
    function getLatestTimestpamp() public view returns(uint256){
        return s_lastTimeStamp;
    }

    function getRequestConfirmations() public view returns(uint256){
        return REQUEST_CONFIRMATION;
    }

}
