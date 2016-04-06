.PHONY: test

example-parser:
	pegjs grammer/pegjs-example.peg parsers/pegjs-example-parser.js

test-parser:
	pegjs grammer/vcl.peg parsers/test-parser.js

parse-example: example-parser
	node test/parse.js --parser pegjs-example-parser --src test/pegjs-example-src.js

test: test-parser
	node test/parse.js --parser test-parser --src test/test.vcl
