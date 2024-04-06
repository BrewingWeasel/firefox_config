#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
   echo "Error: no profile directory given"
   exit 1
fi

trash "$1/user.js" || mv "$1/user.js" "~/.local/share/Trash/files" 2> /dev/null
ln -sf "$PWD/user.js" "$1/user.js"

trash "$1/chrome" || mv "$1/chrome" "~/.local/share/Trash/files" 2> /dev/null
mkdir chrome 2> /dev/null
ln -sf "$PWD/chrome" "$1/chrome"

bash update.sh
