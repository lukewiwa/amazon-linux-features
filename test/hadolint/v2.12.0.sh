#!/bin/bash

set -e

# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --features oh-my-zsh --base-image amazonlinux:2 .

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "hadolint version" hadolint --version | grep "2.12.0"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
