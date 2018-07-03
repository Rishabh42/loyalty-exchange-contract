pragma solidity ^0.4.17;

contract loyalty {
  address public owner;

struct User {
    uint256 Uid;
    bytes32 Uname;
    bool Uset;
}

struct Company {
  uint256 Cid;
  bytes32 Cname;
  bool Cset;
}

  mapping(address => User) public users;
  mapping(address => Company) public companies;

  constructor loyalty() public{
    owner = msg.sender;
  }

  function createUser(uint256 _userId, bytes32 _userName) public {
      address _userAddress = msg.sender;
      User storage user = users[_userAddress];
      // Check that the user did not already exist:
      require(!user.Uset);
      //Store the user
      users[_userAddress] = User({
          Uid: _userId,
          Uname: _userName,
          Uset: true
      });
  }

  function createCompany(uint256 _companyId, bytes32 _companyName) public {
      address _companyAddress = msg.sender;

      Company storage company = companies[_companyAddress];

      require(!company.Cset);

      companies[_companyAddress] = Company({
          Cid: _companyId,
          Cname: _companyName,
          Cset: true
      });
  }
}
