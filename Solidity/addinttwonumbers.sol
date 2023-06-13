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

    function showsquare() public view returns(uint256 number){
       uint256 num = favouritenumber**2;
        return num;
    }
    function storetwonum(uint256 num1, uint256 num2) public returns(uint256 number) {
        favouritenumber = num1;
        second_favnum = num2;
        sumofnums = num1+num2;
        return sumofnums;
    }
    function sumoftwonum() public view returns(uint256 number){
        return sumofnums;
    }



}
