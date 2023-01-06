#!/usr/bin/env bash

set -eux

# install required dependencies
yum install -y zsh git util-linux-user

# Install oh my zsh
USER="$_CONTAINER_USER" \
HOME="$_CONTAINER_USER_HOME" \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
