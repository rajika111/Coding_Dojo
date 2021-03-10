//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.1;



contract TechInsurance 
 {
    
    /** 
     * Defined two structs
     * 
     * 
     */

    struct Product {
        uint productId;
        string productName;
        uint price;
        bool offered;
    }
     
    struct Client {
        bool isValid;
        uint time;
    }
    
    
    mapping(uint => Product) public productIndex;
    mapping(address => mapping(uint => Client)) public client;
    
    mapping(uint => address) public productid2client;
    
    uint productCounter;
    
    address payable insOwner;
    
    constructor(address payable _insOwner) public{

      insOwner = _insOwner;
    }
 
    function addProduct(uint _productId, string memory _productName, uint _price ) public {
        productCounter++; 
        Product memory newProduct =Product(_productId, _productName, _price, true);
        productIndex[productCounter++] = newProduct;
    }
    
     
    function doNotOffer(uint _productIndex) public {
        require (msg.sender == insOwner, "not owner"); 
     productIndex [_productIndex].offered= false;
    }
    
    function forOffer(uint _productIndex) public {
    require (msg.sender == insOwner, "not owner"); 
     productIndex [_productIndex].offered= true;
    }
    
    function changePrice(uint _productIndex, uint _price) public {
    require (msg.sender == insOwner, 'not owner');
    productIndex [_productIndex].price = _price;
    }
    
    /**
    * @dev 
    * Every client buys an insurance, 
    * you need to map the client's address to the id of product to struct client, using (client map)
    */
    
    function checkProductIndex (uint _productIndex) public returns (bool) {
        
    }
    function buyInsurance(uint _productIndex) public payable {
        
        require (productIndex[_productIndex].offered == true, 'product not offered');
        
        address buyer_address =  msg.sender;
        address product_seller_address = productid2client[_productIndex];
        require(product_seller_address !=buyer_address , "you cant buy from yourself.");
        productid2client[_productIndex]= buyer_address;
        productIndex[_productIndex].offered == false;
        
    } 
    
   
    
}