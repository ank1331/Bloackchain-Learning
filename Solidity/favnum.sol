//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

contract favouriteNum{


    uint256 favouritenumber;
    uint256 second_favnum;
    uint256 sumofnums;

    function storenumber(uint256 _fav) public  {
        favouritenumber = _fav;
    }

    function showNumber() public view returns(uint256 number){
        return favouritenumber;
    }
}
