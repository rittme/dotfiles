#!/usr/bin/env bash
set -e -v # Exit on error and print executed commands

# Install Package Control + preferences
CODE_CONFIG="$HOME"/Library/"Application Support"/Code
CODE_USER="$CODE_CONFIG"/User

ln -sf "$PWD"/code/settings.json "$CODE_USER"
