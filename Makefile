# Check if we need to prepend docker commands with sudo
SUDO := $(shell docker version >/dev/null 2>&1 || echo "sudo")


ETLHASH= stellar/stellar-etl:$(shell git ls-remote https://github.com/stellar/stellar-etl HEAD | awk '{print $1;}')

docker-build:
	$(SUDO) docker build -t $(ETLHASH) -t stellar/stellar-etl:latest .

docker-push:
	$(SUDO) docker push $(ETLHASH)
	$(SUOD) docker push stellar/stellar-etl:latest