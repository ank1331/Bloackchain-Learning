# Bloackchain-Learning
6th May - Learn Blockchain, Solidity, and Full Stack Web3 Development with JavaScript – 32-Hour Course - 3 hours done
7th May - leared how to call smart contracts through contracts, inheritence, virtual and overide are required to modify a function in parent contract. video compelted till 4:51
8th May - 
1. Learned about Modifier 
2. How to transfer money from one account to another
3. how to create fund transfer function
9th May - 
1. Studying Constant and immutable key word
  1. Constant - agar koi variable change nahi ho raha and is outside function then put constant before that, you will save gas
  2. e.g uint public constant name_of_variable = 50;
  1. Immutable - voh function jinhe hum uss line mai declare nahi karte 
  2. uint public name;
  3. contructor(){name = "test";}
  4. inn variables ko jo ki constant hote hai, we make immutable
  5. e.g uint public immutable name;
2. Error handling 
  1. error notOwner();
  2. if (msg.owner != owner) {revert NotOwner()}
3. Receive Function
  1. receive() external payable{}, yeh function trigger hota hai jab bhi hum transtion mai value nahi daalte and koi bhi amount from 0 to infity ka transtin karte hai
4. Fallback funcition similar to receive function, par jab hum transtact mai data daalte hai to solidty contract mai receive ke alava koi aur function dekhta hai and agar koi function nahi milata to we go to fallback function
  1. fallback() external payable{} 
 ************************** video done till 5:30:44 ***********************************************************
