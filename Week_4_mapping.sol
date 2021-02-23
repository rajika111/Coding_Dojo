pragma solidity >=0.4.22 <0.8.0;

contract AddressToBytes32Map {
    
    mapping(address => bytes32) internal map;
    mapping(string => string) internal strMap;


    function add(address _city_name , bytes32 _country_name) public {
        map[_city_name] = _country_name;
        
    }

    function remove(address _city_name) public {
        require(contains(_city_name));
        delete map[_city_name];
    }
    
    function contains(address _city_name) public view returns (bool) {
        return map[_city_name] != 0;
    }
    
    function getByKey(address _city_name) public view returns (bytes32) {
        return map[_city_name];
    }
    
    
    function storeInputs (string _city_name, string _country_name) public returns (string) {
    strMap[_city_name] = _country_name;
    
    }
}