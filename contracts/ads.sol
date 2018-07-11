pragma solidity ^0.4.17;

contract ads {
  address[] public redeemed;
  mapping(address => uint256) balances;
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  function newAd(string _ad, uint price, bytes32 adID) public payable{
    require(msg.value > price);
    redeemed.push(msg.sender);
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
