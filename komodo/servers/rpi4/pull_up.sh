#! /bin/bash

docker compose -f periphery.compose.yaml --env-file compose.env pull
docker compose -f periphery.compose.yaml --env-file compose.env up -d
