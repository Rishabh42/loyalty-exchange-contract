const path = require('path');
const fs = require('fs');
const solc = require('solc');

const loyaltyPath = path.resolve(__dirname, 'contracts', 'loyalty.sol');
const source = fs.readFileSync(loyaltyPath, 'utf8');

module.exports = solc.compile(source, 1).contracts[':loyalty'];
//console.log(solc.compile(source, 1));

