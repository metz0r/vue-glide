#!/bin/sh

set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  npm run build:lib
  git add -A
  git commit -m "Dist: Build $VERSION"
  npm version $VERSION -m "Release $VERSION"
  git push origin master
  npm publish
fi