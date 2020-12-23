compile:
	@truffle compile

migrate:
	@truffle migrate

tests:
	@truffle test $(path)

qa:
	@eslint ./test ./migrations
