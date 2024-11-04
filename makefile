.PHONY: build copy shell all

# options arm64 or amd64
PLATFORM?=arm64

all:
	make build
	make copy

build:
	docker build \
		--platform linux/$(PLATFORM) \
		-t amazonlinuxmagick .
	# --progress plain \

copy:
	docker run \
		--rm -it \
		--platform linux/$(PLATFORM) \
		-v $(shell pwd)/binaries:/root/output \
		amazonlinuxmagick \
		mv /root/result /root/output
shell:
	docker run \
		--rm -it \
		--platform linux/$(PLATFORM) \
		-v $(shell pwd)/binaries:/root/output \
		amazonlinuxmagick \
		sh
