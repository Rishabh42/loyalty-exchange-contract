pragma solidity ^0.4.17;

contract loyalty {
  address public owner;
  struct{
    string name;
    string email;
    
  }
  mapping (uint => address) public companies;

  constructor loyalty() public{
    owner = msg.sender;
  }

  function newEntry(uint cName) public {
    companies[cName] = msg.sender;
  }

}
