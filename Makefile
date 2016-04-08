.PHONY: test

parser:
	pegjs vcl.peg vcl-parser.js

test: parser
	node --harmony_rest_parameters test.js --src test.vcl --backends
