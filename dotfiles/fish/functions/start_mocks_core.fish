podman login gitlab.caplin.com:5050 -u briand -p $(cat ~/dev/my-data/gitlab_secret)
podman pull gitlab.caplin.com:5050/integration/fx-integration-api/mocks
podman run --rm -p 18080:18080 -p 15001:15001 -p 15002:15002 gitlab.caplin.com:5050/integration/fx-integration-api/mocks start-core.sh
