// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./StorageFactory.sol";


contract Inheritence is SimpleStorage{

    function store (uint256 favnum) public override{
        favoriteNumber = favnum+5;
    }

}
