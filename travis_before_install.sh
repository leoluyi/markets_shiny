#!/bin/bash

main() {
  setup_dependencies

  echo "INFO:
  Done! Finished setting up Travis-CI machine.
  "
}

setup_dependencies() {
  echo "INFO:
  Setting up dependencies.
  "

  # update is required to update the repositories to see the new packages for
  # Docker.
  sudo apt update -y

  # Now we can install the newer docker-engine which is required for the newer
  # docker-composer we will install next. The messy options are to force it to
  # be non-interactive (normally it asks you a bunch of config questions).
  sudo apt remove docker docker-engine docker.io
  sudo apt install --only-upgrade -o Dpkg::Options::="--force-confold" -y docker-ce

  # Print out the current docker-compose version. Once this reports 1.6+ then we
  # do not need the following steps.
  docker version
  docker-compose --version

  # As of the writing of this script Travis has docker-compose v1.4.2, we need
  # to update it to 1.8+. $DOCKER_COMPOSE_VERSION is provide from the `env`
  # above.
  sudo rm -f /usr/local/bin/docker-compose
  curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > docker-compose
  chmod +x docker-compose
  sudo mv docker-compose /usr/local/bin

  # Check that docker-compose is now running the latest version (or at least the
  # one we specified). This is not to be confused with the version we printed
  # before doing the update.
  docker-compose --version
  docker info
}

main
