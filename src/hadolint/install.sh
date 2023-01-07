#!/usr/bin/env bash

yum install -y curl

architecture="$(uname -m)"
case $architecture in
    x86_64) architecture="x86_64";;
    aarch64 | armv8* | arm64) architecture="arm64";;
    *) echo "(!) Architecture $architecture unsupported"; exit 1 ;;
esac


HADOLINT_VERSION=${VERSION:-"latest"}
# Get the latest version if specified and remove the "v" prefix
if [ "$HADOLINT_VERSION" = "latest" ]; then
  HADOLINT_URL=$(curl -Ls -o /dev/null -w "%{url_effective}" "https://github.com/hadolint/hadolint/releases/latest/")
  HADOLINT_VERSION="${HADOLINT_URL#*/v}"
fi


curl -sSL "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-${architecture}" \
  --output /usr/bin/hadolint

chmod +x /usr/bin/hadolint
