pragma solidity ^0.5.0;


contract Adoption {

    // array of ethereum addresses
    // public means automatic getter methods
    address[16] public adopters;

    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);
        // I suppose this function is exited if this require statement fails

        adopters[petId] = msg.sender;

        return petId;
    }

// public view returns, the view keyword is readonly
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
