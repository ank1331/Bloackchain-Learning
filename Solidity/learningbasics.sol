// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 <0.9.0;

contract test{
    // this is contract for testing

    uint256 public newval;
    struct Table {
        uint size;
        string name;
    }

    Table[] public table;
    mapping(string => uint) public nametofavnum;


function addNewTable(uint _size, string memory name) public {
    table.push(Table(_size,name));
    nametofavnum[name] = _size;
}

}
