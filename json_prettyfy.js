#!/usr/bin/env node

var fs = require('fs')
var content = fs.readFileSync(process.argv[2], 'utf8');
console.log(JSON.stringify(JSON.parse(content), null, '\t'));


