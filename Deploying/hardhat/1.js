require("@nomicfoundation/hardhat-ethers");
const {ethers} = require("hardhat");
require("dotenv")


async function main(){
    const simpleStorageFactory = await ethers.getContractFactory("SimpleStorage.sol")
    console.log("deploying");
    const  simpleStorage = await simpleStorageFactory.deploy()
    await simpleStorage.deployed()
}

main()
    .then(()=> process.exit(1))
    .catch((error)=>{
        console.log(error);
        process.exit(1)
    })
