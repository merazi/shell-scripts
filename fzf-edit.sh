#!/usr/bin/env bash

## open a file with fzf
du . -a | awk '{print $(NF)}' | fzf -i | xargs -r emacs
