#!/bin/bash
# set -e # exit on first failure

git rev-parse --is-inside-work-tree # check if a git repo

TARGET_BRANCH=$1
COMPARED_BRANCH=${2:-"origin/master"}
echo "Linting changes in $TARGET_BRANCH since $COMPARED_BRANCH"
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

for file in $(git -C "$PWD" diff $COMPARED_BRANCH...$TARGET_BRANCH --name-only | grep -E '\.(js|jsx)$')
do
  # it can only work with whole files. I must use show and then filter to only show comments for changed lines
  git show "$TARGET_BRANCH:$file" | "$SCRIPT_PATH/node_modules/.bin/eslint" --stdin --stdin-filename "$file" -c "$SCRIPT_PATH/eslint_config/.eslintrc"
done
