
contract CetaToken {
    address public constant owner = 0x7F6d79521C59d6319296bCd0D35051b553Deb995;
    uint256 public constant totalSupply = 1000000000;
    string public name;
    string public symbol;
    uint8 public decimals;

    mapping(address => mapping(address => uint256)) private allowed;
    mapping(address => uint256) private balances;

    event Approval(
        address indexed tokenholder,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    // ----------------------------------------------------------------------------
    // Sample token contract
    // Symbol        : {{Token Symbol}}
    // Name          : {{Token Name}}
    // Decimals      : {{Decimals}}
    // Balance       : {{Total Supply}}
    // ----------------------------------------------------------------------------

    constructor() public {
        name = "CETA coin";
        symbol = "CET";
        decimals = 0;
        balances[owner] = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }

    // ------------------------------------------------------------------------
    // Total Balance
    // ------------------------------------------------------------------------
    function transferableTokens(address holder) public view returns (uint256) {
        return balanceOf(holder);
    }

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // ------------------------------------------------------------------------
    function transfer(address _to, uint256 _value) public returns (bool) {
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // ------------------------------------------------------------------------
    // Transfer tokens from the from account to the to account
    // ------------------------------------------------------------------------
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        balances[_from] = balances[_from] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function allowance(address _tokenholder, address _spender) public view returns (uint256 remaining){
        return allowed[_tokenholder][_spender];
    }

    // ------------------------------------------------------------------------
    // Contract function to receive approval
    // ------------------------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function balanceOf(address _tokenholder)
        public
        view
        returns (uint256 balance)
    {
        return balances[_tokenholder];
    }
}
