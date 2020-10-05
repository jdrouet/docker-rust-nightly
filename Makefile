EXTRA_ARGS?=
DATE_TAG=$(shell date +"%Y%m%d")

debian: debian-buster debian-buster-slim debian-stretch debian-stretch-slim

debian-buster:
	docker buildx build ${EXTRA_ARGS} \
		--build-arg BASE_TAG=buster \
		--tag jdrouet/rust-nightly:buster \
		--tag jdrouet/rust-nightly:buster-${DATE_TAG} \
		--platform linux/amd64,linux/386,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x \
		debian

debian-buster-slim:
	docker buildx build ${EXTRA_ARGS} \
		--build-arg BASE_TAG=buster-slim \
		--tag jdrouet/rust-nightly:buster-slim \
		--tag jdrouet/rust-nightly:buster-slim-${DATE_TAG} \
		--platform linux/amd64,linux/386,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x \
		debian

debian-stretch:
	docker buildx build ${EXTRA_ARGS} \
		--build-arg BASE_TAG=stretch \
		--tag jdrouet/rust-nightly:stretch \
		--tag jdrouet/rust-nightly:stretch-${DATE_TAG} \
		--platform linux/amd64,linux/386,linux/arm64,linux/arm/v7 \
		debian

debian-stretch-slim:
	docker buildx build ${EXTRA_ARGS} \
		--build-arg BASE_TAG=stretch-slim \
		--tag jdrouet/rust-nightly:stretch-slim \
		--tag jdrouet/rust-nightly:stretch-slim-${DATE_TAG} \
		--platform linux/amd64,linux/386,linux/arm64,linux/arm/v7 \
		debian