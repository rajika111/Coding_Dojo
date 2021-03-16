//SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract Permissions {
    address public contractOwner;
    // uint M = 2;
    address [] public authenticators ;
    // address [] public n_Authenticators;

    mapping (address => bool) public isAdmin;
    
    constructor() public {
        contractOwner = msg.sender;
        isAdmin[msg.sender] = false;
    }
 
    //---  the function modifiers ---- ///
    
    modifier onlyContractOwner() {
        require(msg.sender == contractOwner, "Not contract owner");
        _;
    }
    
    modifier notNull(address _address) {
    require(_address != address(0));
        _;
    }
    
    
    modifier AuthenticatorExist(address _address) {
        require(isAdmin[_address] == false, "already added!");
        _;
  }

    // -- helper functions
    function getAuths() public view returns (address[] memory)
    {
        return authenticators;
    }
    
    function addAuths(address _address) public onlyContractOwner() AuthenticatorExist(_address) notNull(_address) {
         isAdmin[_address] = true;
        
    }
    
    function Authrize() public  returns (uint _x) {
        require(isAdmin[msg.sender] == true, "no you can't");
        authenticators.push(msg.sender);
        return (authenticators.length);
    }
    

}