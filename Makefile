service := kronos-tg-bot
version := 0.0.5
gcloud_proj_id := chainlancer-384913
cluster := chainlancer
gcr-image := gcr.io/${gcloud_proj_id}/${service}:${version}

bumpversion-patch:
	bumpversion patch --allow-dirty

bumpversion-minor:
	bumpversion minor --allow-dirty

bumpversion-major:
	bumpversion major --allow-dirty

docker-build:
	docker build -t $(gcr-image) .

docker-build-amd64:
	docker buildx build --platform linux/amd64 -t $(gcr-image) .

docker-dev:
	make docker-build
	make docker-run

docker-push:
	docker push $(gcr-image)

k8s-deploy:
	kubectl apply -f k8s/deploy.yml