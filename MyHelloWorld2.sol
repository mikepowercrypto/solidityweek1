pragma solidity 0.5.12;


contract MyHelloWorld2{
    
    
     struct Person {
      uint id;
      string name;
      uint age;
      uint height;
      
    }
   
    mapping (address => uint) public people;
    
    
    
     function createPerson(string memory name, uint age, uint height) public {
        
        
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;

        people [msg.sender] = 100;
        
     }
     
     function getPerson() public view returns(uint){
        
        return people[msg.sender];
    }
}