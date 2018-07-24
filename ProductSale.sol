pragma solidity ^0.4.0;
contract ProductSale
{
    uint saleAmount;
    string product;
    address owner;  
    address buyer;
       function ProductSale(uint _saleAmount, string _product) public{
        saleAmount = _saleAmount;
        product = _product;
        owner = msg.sender;
        
        }
          modifier require(bool _condition) {
        if (!_condition)  throw;
        _;
    }
         modifier ownerOnly {
        if (msg.sender != owner) throw;
        _;
    
         }
           modifier buyerOnly {
         if (msg.sender != buyer) throw;
        _;
    
         }
    function GetContractAddress() public constant returns (address) {
        return this;
    }
    function GetOwnerAddress() public constant returns (address) {
        return owner;
    }
     function GetBuyerAddress() public constant returns (address) {
        return buyer;
    }
   function BuyProduct() public{
       if(msg.sender!=owner)
       {
          buyer= msg.sender;
       }
       
   }   
       /*function PayAmount()payable public{
           if( msg.sender==buyer &&  msg.value==((10**18)*saleAmount)){
           owner.transfer(msg.value);
            
        }
       }*/
       
       function PayAmount()payable public
         buyerOnly
      require(msg.value == ((10**18)*saleAmount))
    {
         owner.transfer(msg.value);
    }
       
   
}
