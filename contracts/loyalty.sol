pragma solidity ^0.4.17;

contract loyalty {
  address public owner;

  mapping (uint => address) public companies;

  constructor loyalty() public{
    owner = msg.sender;
  }

  function newEntry(uint cName) public {
    companies[cName] = msg.sender;
  }

}
