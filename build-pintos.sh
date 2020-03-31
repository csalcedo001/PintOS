#!/bin/bash
# created by csalcedo001

if [[ "$(docker images -q pintos_image_cache)" == "" ]]; then
	# Initialize pintos cache image

	# Avoid push of user defined files
	./git-unchanged-files

	# Create cached image for quick pintos_image rebuild
	docker build -t pintos_image_cache .
fi

if [[ "$(docker images -q pintos_image)" == "" ]]; then
	# Build pintos image
	docker build -t pintos_image .
	docker run -it --name pintos_session pintos_image
else
	echo "Already built pintos image."
fi
