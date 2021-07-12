const CetaToken = artifacts.require("CetaToken")
module.exports = function(deployer) {
    deployer.deploy(CetaToken);
};