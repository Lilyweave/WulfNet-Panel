#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

echo "Ensure this script is in your main repository folder."
echo "Current script directory: $SCRIPT_DIR"

# Branch prompt, defaulting to the branch you're on
DEFAULT_BRANCH="$(git branch --show-current)"
DEFAULT_BRANCH="${DEFAULT_BRANCH:-main}"
read -p "Branch [$DEFAULT_BRANCH]: " -r BRANCH
BRANCH="${BRANCH:-$DEFAULT_BRANCH}"

# Commit message prompt
read -p "Commit message: " -r COMMIT
COMMIT="${COMMIT:-No details given...}"

echo
echo "Branch:  $BRANCH"
echo "Message: $COMMIT"

read -p "Ready to commit? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Sending github commit to $BRANCH..."
else
    echo "Cancelled."
    exit 1
fi

git add . && git commit -m "$COMMIT" && git push -u origin "$BRANCH"