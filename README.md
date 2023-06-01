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
  ``` solidity
   uint public name;
   contructor(){name = "test";}
   ```
  
  5. inn variables ko jo ki constant hote hai, we make immutable
  6. e.g uint public immutable name;
2. Error handling 

  ``` solidity
   error notOwner();
   if (msg.owner != owner) {revert NotOwner()}
  ```
3. Receive Function
  1. receive() external payable{}, yeh function trigger hota hai jab bhi hum transtion mai value nahi daalte and koi bhi amount from 0 to infity ka transtin karte hai
4. Fallback funcition similar to receive function, par jab hum transtact mai data daalte hai to solidty contract mai receive ke alava koi aur function dekhta hai and agar koi function nahi milata to we go to fallback function
  1. fallback() external payable{} 
 ************************** video done till 5:30:44 ***********************************************************
 
 ### 10th May
 1. How to debug error
 2. updated Git with latest code for fund me code
 ************************** video done till 5:53:52 ***********************************************************

### 12th May
1. Ubuntu installed 

### 13th May
1. Going through the block chain bootcamp course

### 15th May
1. Going thorugh Block chain bootcamp

### 18th May
1. Nothing
### 23rd May
1. Blockchain Security course
### 24th May
1. Block Chain Security course continues
### 25th May
1. Block chain security course
### 26th May
1. worked on Block chain video and running the solidity code on VS code
### 27th May
1. video 6hours 18 mins ke aage --- lets see aaj kitna hota hai
2. Remix mai hum bus compile button dabate hai and deploy kar dete hai 
3. Hum yeh functions javascript mai banayege in VScode
4. Javascript mai sab kuch ek main functions mai daalo and then run karo
5.Setps: 
                  ### Remix                        |                  ### JavaScript
            1. sabse pehele compile karte hai     |    1. isme complile karne ke liye **solc** package use karte hai
                code                              |
                                                  |    2. Ganache fake blockchain hoti hai jo locally run hoti hai, we can use it to deploy code
                                                  |        we can use HardHat also iski jagah
       
 6. Jab apan run karte hai javascript VM pe, to remix fake blockchain bana ke uspe run karta hai
 7. jab apan web injectd web 3 pe run karte hai to voh meta mask pe jo n/w apan ne choose kiya hai usse RPC URL se connect karta hai
  RPC - Remote Procedure Call
        Yeh RPC url hume ek blockchain node se connect karata hai
        Yeh blockchain node - Basically ek computer jo yeh api(RPC URL) ko dikhata hai, ki bhai isse connect karna hai to kar lo
        apan ganache ka http server JS code mai daalte hai, jisse usse call kar paye 
        **ethers.js** yeh hume api call karne mai use karti hai, 
              API call kyu karne hai -- different blockchain se connect karne ko
              isme kya hota hai -- Wrapper function jo api calls karta hai( yeh wrapper mai axios jaise hote hai jo api call karte hai)
 
 ### 28th May
 1. Hum reterieve use karte hai, to get the value
 2. Update karege contract to store favourite number as 8
      ```solidity
      const tranResponse = await contract.store("7")
      const tranReceipt = await tranResponse.wait(1)
      const updatedNum = await contract.retrieve()
      console.log(`updated Number ${updatedNum}`)
      ```
      
  3. We have created env variable file to store the variables
*********************************
Deploying on Rinkby network from Ganache
########################### Learning Hard hat ###################################
### 29th May
1. Start learning Hardhat
2. Completed till 9 hours 06 mins
### 30th May
1. COntract create kiya
2. rinkyby ke details se contract deploy kiya
3. verify kiya contract 
4. Hardhat mai custoom task likh rahe hai
5. humne local host ka env banaya and use kiya account and eth given by hardhat
6. console mai editi ki
7. test script likhi
8.video completed till 9:30 -- but see how do we test part from starting
### 31st May
1. Need to work on course.. not working doing office work
2. completed till 9:38. How test cases are written and executed , we used chai and assert and expect key word. did not write the test casess though. Need to start Hardhat Gas reporter.
### 1st June
1. working on hardhat gas reporter function, jo batata hai kitni gas use hoti hai aap ke funaction mai
2. Hum pehele install karte hai npm se, and then config mai add karte hai gas reporter, phir hum cinfig mai jake changes karte hai 
3. con market API use karte hai so as to get the USD conversion of gas to USD 
4. Next topic solidity coverage - - this goes through our solidity code and hume batata hai ki hum ne jo test likhe hai usme kitni lines nahi cover ho rahi, matlab ki bhai yeh do lines tum test nai kar rahe ho aise( yarn --dev solidity-coverage)
5. reached 9:45
6. 

