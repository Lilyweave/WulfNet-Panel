#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "$SCRIPT_DIR"

COMMIT="No details given..."

echo "Ensure this script is in your main repository folder."
echo "Current script directory: $SCRIPT_DIR"

read -p "Ready to commit? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Sending github commit to $BRANCH..."
else
    echo "Cancelled."
    exit 1
fi

cd $SCRIPT_DIR && git add . && git commit -m "$COMMIT" && git push -u origin $BRANCH
