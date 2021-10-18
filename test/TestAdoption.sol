pragma solidity ^0.5.0;

// Assert is for test assertions
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption {

   // the contract to be tested, gets the addresses from DeployedAddresses.
    Adoption public adoption = Adoption(DeployedAddresses.Adoption());

    uint public expectedPetId = 8;

    // this will return currenct contract address
    address public expectedAdopter = address(this);

    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected Pet should be this contract");
    }

    function testGetAdopterAddressByPetIdInArray() public {
  // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}