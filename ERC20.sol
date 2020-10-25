pragma solidity 0.5.12;
import"./Ownable.sol";

contract ERC20 is Ownable{
    
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    address _recipient;
    
    mapping(address => uint256) private _balances;
   
    
    constructor() public{
        _name = "BitMick";
        _symbol = "BTM";
        _decimals = 8;
        _totalSupply = 100000000;
        _balances[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = _totalSupply;
        _recipient = 0x744bc747A0E39F6C81B96745939a4366A2f0c98b;
        
    }
    
    function BitMick() public view returns(string memory){
        return _name;
    }
    
    function symbol() public view returns (string memory){
        return _symbol;
    }

    function decimals() public view returns (uint8){
        return _decimals;
    }        

    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }
    
    function balanceOf(address account) public view returns (uint256){
        return _balances[account]; 
    }

    function mint(address account, uint256 amount) public onlyOwner{
        require(account != address(0), "mint to the zero address");
        
        _totalSupply = _totalSupply + amount;
        _balances[account] = _balances[account] + amount;
    }
    
    function transfer(uint256 amount) public returns(bool){
        require(_recipient != address(0), "transfer to the zero address");
        require(_balances[msg.sender] >= amount, "Insufficient balance");
        
        _balances[msg.sender] =_balances[msg.sender]- amount;
        _balances[_recipient] = _balances[_recipient] + amount;
        
        return true;
    }
    
    
    
}
