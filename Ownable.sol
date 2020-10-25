pragma solidity 0.5.12;


contract Ownable{
    
    
    address internal owner;
    
    

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
    }
    
    modifier costs(uint cost){
       require(msg.value >= cost);
       _; 
    }
      

    constructor() public{
        owner = msg.sender;
    }
    
    
    
}