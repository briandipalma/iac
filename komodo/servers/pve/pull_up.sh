#! /bin/bash

docker compose -f mongo.compose.yaml --env-file compose.env pull
docker compose -f mongo.compose.yaml --env-file compose.env up -d
