#!/bin/bash

docker stop react-app || true
docker rm react-app || true

docker run -d \
  --name react-app \
  -p 8080:80 \
  react-app:latest
