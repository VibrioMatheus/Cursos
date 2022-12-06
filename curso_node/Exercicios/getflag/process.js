const myModule = require('./exports')

console.log(`Ola ${myModule('--name')}, ${myModule('--greeting')}`)