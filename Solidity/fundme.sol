// get fund from user
// withdraw fund
// minimum kitna amount dena hai kisi ko aga dena ho to 


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract fundme{

    uint public constant kumsesumpaise=50*1e18;
    address[] public funders; 
    mapping(address => uint) public addresstovalue;

    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }

    error notOwner();

    function paisado() public payable {
        // min func amount usd mai dena chahate hai
        require(getConversionrate(msg.value) >=kumsesumpaise, "kum se kum 1 eth chaiye");
        // iss part ke false hone ki vajah se neech jitni bhi computation ke liye gas use hogi that would be we reverserd
        funders.push(msg.sender);
        addresstovalue[msg.sender] = msg.value;

    }

    function getPrice() public view returns(uint256) {
        
        //address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        return uint256(price* 1e10);
    }

    function getConversionrate(uint256 ethAmount) public view returns(uint256) {
        uint256 getPriceofethinusd = getPrice();
        uint256 ethamountinusd = (getPriceofethinusd*ethAmount)/1e18;
        return ethamountinusd;

    }
    function paisawithdrawkaro() public onlyOwner{
        for(uint funderIndex = 0; funderIndex<funders.length; funderIndex++){
            address fund = funders[funderIndex];
            addresstovalue[fund] = 0;
        }

        funders =new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address (this).balance}("");    

    }
// agar mujhe yeh har jagah use karna hai 
    modifier onlyOwner{
        //require(msg.sender == owner, "sender is not owner");
        if(msg.sender!=owner) {revert Notowner();}
        _;
    }
}
