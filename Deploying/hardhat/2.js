
const { ethers, run } = require("hardhat");
require("./tasks/block-number");

async function main(){
    const simpleStorageFactory = await ethers.getContractFactory("SimpleStorage")
    console.log("deploying");
    const  simpleStorage = await simpleStorageFactory.deploy()
    await simpleStorage.waitForDeployment()
    const address=await simpleStorage.getAddress()
    console.log(`the address is ${address}`);
    const currentvall= await simpleStorage.retrieve()
    console.log(`current value is ${currentvall}`);
    const newval = await simpleStorage.store(9)
    newval.wait(1)
    const finalval = await simpleStorage.retrieve()
    console.log(`New value is ${finalval}`);

}

main()
    .then(()=> process.exit(0))
    .catch((error)=>{
        console.log(error);
        process.exit(1)
    })
    





