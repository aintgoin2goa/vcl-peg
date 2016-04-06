'use strict';
const fs = require('fs');
const path = require('path');
const argv = require('minimist')(process.argv.slice(2));
const parser = require('../parsers/' + (argv.p || argv.parser));
const colors = require('colors');

let src = fs.readFileSync(path.resolve(__dirname, '../', (argv.s || argv.src)), {encoding:'utf8'});
let result;

try{
	result = parser.parse(src);
}catch(e){
	if(e.name === "SyntaxError"){
		console.log(colors.red(`Syntax Error!  line ${e.location.start.line}, column ${e.location.start.column}: ${e.message}`));
	}else{
		console.error(e);
	}

	process.exit(1);
}


console.log(result);

