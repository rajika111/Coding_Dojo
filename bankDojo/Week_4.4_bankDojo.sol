pragma solidity >=0.6.0;


contract bankOfDojo {
    
    mapping(address => uint256) private balance;
    
    address public owner;
    address public coOwner;
    
    
    constructor (address giveMetheAddress) public {
        require(msg.sender != giveMetheAddress, "Add your co owner");
        owner = msg.sender;
        coOwner = giveMetheAddress;
     
    }
    
    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == coOwner , "only owner");
        _;
    }
    
    function txDe() public payable {
        require(balance[msg.sender] + msg.value >= balance[msg.sender]);
        balance[msg.sender] += msg.value;
        
    }
    
    function balances() public view returns(uint256){
        return balance[msg.sender];
    }
    
    function withdraw(uint256 amount) public {
 
    }

    
    
} 