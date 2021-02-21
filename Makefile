DOCKER_IMAGE_NAME=gambit-docker
DOCKERHUB_LINK=pmariglia/${DOCKER_IMAGE_NAME}

build:
	docker build . -t ${DOCKER_IMAGE_NAME}

tag:
	docker tag ${DOCKER_IMAGE_NAME} ${DOCKERHUB_LINK}

release: tag
	docker push ${DOCKERHUB_LINK}