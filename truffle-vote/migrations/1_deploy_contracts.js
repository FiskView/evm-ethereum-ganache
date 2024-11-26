const FiskContract = artifacts.require("FiskContract.sol");

module.exports = function (deployer) {
  deployer.deploy(FiskContract);
};
