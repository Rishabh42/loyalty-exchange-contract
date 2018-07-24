pragma solidity ^0.4.17;

contract ads {

    struct Ad{
        string name;
        uint price;
        string id;
    }

 // address[] public redeemed;
  Ad[] public adsArr;
  mapping(address => uint256) balances;
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function adCount() public view returns (uint){
        return adsArr.length;
    }

  function newAd(string name, uint price, string id) public {
    Ad memory newAd = Ad({
            name: name,
            price: price,
            id: id
        });
        adsArr.push(newAd);
  }

  function displayAd(uint index) public view returns (string){
        Ad storage a  = adsArr[index];
        return (a.name);
    }

  function transfer(address _to, uint256 _amount) returns (bool success) {
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
    }

}
