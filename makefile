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

CONTAINER_NAME?=imagemagick_layer
copy:
	docker run \
		--rm -it --name $(CONTAINER_NAME) \
		--platform linux/$(PLATFORM) \
		-v $(shell pwd)/binaries:/root/output \
		amazonlinuxmagick \
		cp -r /root/result /root/output
shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh
	# docker run \
	# 	--rm -it \
	# 	--platform linux/$(PLATFORM) \
	# 	-v $(shell pwd)/binaries:/root/output \
	# 	amazonlinuxmagick \
	# 	sh
