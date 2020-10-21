pragma solidity 0.5.12;

contract HelloWorld{

    struct Person {
      uint id;
      string name;
      uint age;
      uint height;
      bool senior;
    }

    event personDeleted(string name, bool senior, address deletedBy);
    
    event personCreated(string name, uint age);
    
    event personUpdated(string name, uint age, uint height);

    address public owner;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
    }

    constructor() public{
        owner = msg.sender;
    }

    mapping (address => Person) private people;
    address[] private creators;
    
    
    function createPerson(string memory name, uint age, uint height) public {
      require(age < 150, "Age needs to be below 150");
       
        if (people[msg.sender].age != 0){
            people[msg.sender].age = age;
            people[msg.sender].height = height;
            people[msg.sender].name = name;
      
            emit personUpdated(name, age, height);
          
        }
    
        else {
          
            Person memory newPerson;
            newPerson.name = name;
            newPerson.age = age;
            newPerson.height = height;
        

        if (age >= 65){
            newPerson.senior = true;
        }
        
        else {
            newPerson.senior = false;
       }

            insertPerson(newPerson);
            creators.push(msg.sender);

        assert(
            keccak256(
                abi.encodePacked(
                    people[msg.sender].name,
                    people[msg.sender].age,
                    people[msg.sender].height,
                    people[msg.sender].senior
                )
            )
            ==
            keccak256(
                abi.encodePacked(
                    newPerson.name,
                    newPerson.age,
                    newPerson.height,
                    newPerson.senior
                )
            )
        );
             emit personCreated(newPerson.name, newPerson.age); 
          
      }
        
    }
    function insertPerson(Person memory newPerson) private {
        address creator = msg.sender;
        people[creator] = newPerson;
    }
    function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }
   
    function deletePerson(address creator) public onlyOwner{
       string memory name = people[creator].name;
       bool senior = people[creator].senior;
       
       delete people[creator];
       assert(people[creator].age == 0);
       emit personDeleted(name, senior, owner);
   }
    function getCreator(uint index) public view onlyOwner returns(address){
       return creators[index];
   }

}
