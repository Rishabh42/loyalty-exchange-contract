pragma solidity ^0.4.17;

contract loyalty {
  address public owner;

struct User {
    uint256 Uid;
    string Uname;
    bool Uset;
}

struct Company {
  uint256 Cid;
  string Cname;
  bool Cset;
}

  mapping(address => User) public users;
  mapping(address => Company) public companies;

  function loyalty() public{
    owner = msg.sender;
  }

  function createUser(uint256 _userId, string _userName) public {
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

  function createCompany(uint256 _companyId, string _companyName) public {
      address _companyAddress = msg.sender;

      Company storage company = companies[_companyAddress];

      require(!company.Cset);

      companies[_companyAddress] = Company({
          Cid: _companyId,
          Cname: _companyName,
          Cset: true
      });
  }

  function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

/*  function getUsers() public view returns (string) {
        return users[msg.sender].name;
    } */
}
