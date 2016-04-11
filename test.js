'use strict';
const parser = require('./vcl-parser');
const fs = require('fs');
const args = require('minimist')(process.argv.slice(2), {
	alias : {'backends' : 'b'},
	default : {'backends' : false}
});


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
		val = typeof current === 'object'  ? util.inspect(current, {depth:null}) : String(current);
		return previous + '\n' + val;
	}, '');
}

const log = {};
for(let a of logColors){
	log[a[0]] = (...args) => writelog(combineArgs(args), a[1]);
}

let src = fs.readFileSync(args.src, {encoding:'utf8'});

function valueAsJson(value){
	if(value[0] === 'Duration'){
		return value[1] + value[2];
	}

	if(value[0] === 'StringConcatenation'){
		return value[1].reduce((p, c) =>  p + c[1] + ' ', '').trim();
	}

	return value[1];
}

function getBackendsAsJson(result){
	let json = {backends:[], healthchecks:[]};
	for(let r of result){
		if(r[0] === 'Backend'){
			let backend = {name:r[1].name};
			for(let p of r[1].properties){
				if(p[0] === 'Healthcheck'){
					let healthcheck = {backend : backend.name};
					for(let h of p[1]){
						healthcheck[h[1].name] = valueAsJson(h[1].value);
					}
					json.healthchecks.push(healthcheck);
				}else if(p[0] === 'SetBackendProperty'){
					backend[p[1].name] = valueAsJson(p[1].value);
				}
			}
			json.backends.push(backend);
		}
	}

	return json;
}

function onSuccess(result){
	if(args.backends){
		log.success(getBackendsAsJson(result));
	}else{
		log.success(result);
	}

}

let result;

try{
	result = parser.parse(src);
	onSuccess(result);
}catch(e){
	if(e.name === 'SyntaxError') {
		log.error(`Syntax Error! line ${e.location.start.line} column ${e.location.start.column}: ${e.message}`);
	}else if(e.name === 'GammarError'){
		log.error(`${e.name} (${e.location}): ${e.message}`);
	}else{
		log.error(e.name, e.stack);
	}
}
