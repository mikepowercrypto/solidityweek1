pragma solidity 0.5.12;


contract MyHelloWorld{
    
     struct Person {
      uint id;
      string name;
      uint age;
      uint height;
      address walletAddress;
    }
    
    
    
    Person[] public people;
  
   
    function createPerson(string memory name, uint age, uint height, address walletAddress) public {
        people.push(Person(people.length, name, age, height, walletAddress));
        
    }
    
    function getPerson(uint index) public view returns (uint, string memory, uint, uint, address){
        
        return (people[index].id, people[index].name, people[index].age, people[index].height, people[index].walletAddress); 
        
    }
    
    
}