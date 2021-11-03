
IMAGE?=trojansourcedetector
REGISTRY?=ghcr.io/avisi-cloud
VERSION	?=local

docker:
	docker build -t ${REGISTRY}/${IMAGE}:${VERSION} .

publish-docker:
	docker push ${REGISTRY}/${IMAGE}:${VERSION}
