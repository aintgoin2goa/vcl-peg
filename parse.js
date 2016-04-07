'use strict';
const parser = require('./vcl-parser');
const fs = require('fs');
const args = require('minimist')(process.argv.slice(2));
const colors = require('colors');
const util = require('util');

const logColors = new Map([
	['info', null],
	['warn', 'yellow'],
	['error', 'red'],
	['success', 'green']
]);

function writelog(str, color){
	if(color){
		str = colors[color](str);
	}

	console.log(str);
}

function combineArgs(args){
	return args.reduce((previous, current) => {
		let val;
		if(typeof current === 'object'){}
		val = typeof current === 'object'  ? util.inspect(obj, null) : String(current);
		return previous + '\n' + val;
	}, '');
}

const log = {};
for(let a of logColors){
	log[a[0]] = (...args) => writelog(combineArgs(args), a[1]);
}

let src = fs.readFileSync(args.src, {encoding:'utf8'});

let result;

try{
	result = parser.parse(src);
	log.success(result);
}catch(e){
	if(e.name === 'SyntaxError'){
		log.error(`Syntax Error! line ${e.location.from.line} column ${e.location.from.column}: ${e.message}`)
	}else{
		log.error(e.name, e.stack);
	}
}
