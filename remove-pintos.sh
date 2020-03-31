#!/bin/bash
# created by csalcedo001

if [[ "$(docker images -q pintos_image)" != "" ]]; then
	docker rm pintos_session
	docker rmi pintos_image
else
	echo "No pintos image to be removed."
fi
