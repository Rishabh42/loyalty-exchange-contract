pragma solidity ^0.4.17;

contract loyalty {
  address public owner;
  mapping(address => uint256) balances;

struct User {
    uint256 Uid;
    string Uname;
    bool Uset;
    string[] public companyName;
    uint points;

}

struct Company {
  uint256 Cid;
  string Cname;
  bool Cset;
}

struct Ad{
    string name;
    uint price;
    string id;
    uint pointsEarned;
}

  mapping(address => User) public users;
  mapping(address => Company) public companies;

  function loyalty() public{
    owner = msg.sender;
  }

  function createUser(uint256 _userId, string _userName, string _companyName) public {
      address _userAddress = msg.sender;
      User storage user = users[_userAddress];
      // Check that the user did not already exist:
      require(!user.Uset);
      //Store the user
      users[_userAddress] = User({
          Uid: _userId,
          Uname: _userName,
          companyName: companyName[].push(_companyName),
          points: companyName.length * 100;
          Uset: true
      });
  }

/*  function checkoutAd(uint256 _userId, int adsId){
    // get baseComapny and toTransferComp, reductionValue from ads mapping
    require(users[_userId][baseComapny]> 0){
      users[_userId][toTransferComp] = users[_userId][toTransferComp] + reductionValue;
      users[_userId][baseComapny] = users[_userId][toTransferComp] - reductionValue;
    }
  }*/

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
         _owner = msg.sender;
        return balances[_owner];
    }

  /*function getCompany(uint index) public view returns (string){
        Company storage cc  = companiesArr[index];
        return (cc.Cname);
    }

  function getUser(uint index) public view returns (string){
        User storage uu  = userArr[index];
        return (uu.Uname);
    }*/

    // address[] public redeemed;
     Ad[] public adsArr;
     //mapping(address => uint256) balances;
     event Transfer(address indexed _from, address indexed _to, uint256 _value);

       function adCount() public view returns (uint){
           return adsArr.length;
       }

     function newAd(string name, uint price, string id, uint points) public {
       Ad memory newAd = Ad({
               name: name,
               price: price,
               id: id,
               points: points    //ponts earned on redemption
           });
           adsArr.push(newAd);
     }

     function displayAd(uint index) public view returns (string){
           Ad storage a  = adsArr[index];
           return (a.name);
       }

     function earnPoints() public payable{
           require(msg.value = Ad.price);


     }

     /*  function transfer(address _to, uint256 _amount) returns (bool success) {
             if (balances[msg.sender] >= _amount
                 && _amount > 0
                 && balances[_to] + _amount > balances[_to]) {
                 balances[msg.sender] -= _amount;
                 balances[_to] += _amount;
                 Transfer(msg.sender, _to, _amount);
                 return true;
             } else {
                 return false;
             }
         } */

}
