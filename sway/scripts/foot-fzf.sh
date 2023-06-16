#!/bin/sh

RESULT="$(fzf)"

cd "$(dirname "${RESULT}")"
exec zsh # keep zsh shell
