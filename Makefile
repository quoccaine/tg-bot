# todo:

docker-build:
	docker build . -t gcr.io/chainlancer-384913/kronos-tg-bot:0.0.1

docker-build-amd64:
	docker buildx build --platform linux/amd64 -t gcr.io/chainlancer-384913/kronos-tg-bot:0.0.1 .
