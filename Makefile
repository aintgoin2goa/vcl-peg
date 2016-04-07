.PHONY: test

parser:
	pegjs vcl.peg vcl-parser.js

test: parser
	node --harmony_rest_parameters parse.js --src test.vcl
