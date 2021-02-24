// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

abstract contract Abstract {
    uint256 value;
    constructor (uint256 _value){
        
    }
    function getValue () public view returns (uint){
        return value;
    }
}

interface BankInterface {
    function deposit() external payable;
    function balances() external view returns(uint256);
    function withdraw(uint256 amount) external payable returns (uint256);
    function close() external;
}
