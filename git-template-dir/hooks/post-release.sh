#!/bin/sh
# These are run via git-release(1) from visionmedia/git-extras
# npm
if test -f package.json; then
  # If the package.json does not contain a 'private: true', publish it
  node -e "f = './package.json'; p = require(f); process.exit(+(p.private||0))" && npm publish
fi

if test -f setup.py; then
  # If the package is at 0.1.0, register it
  if grep "version='0.1.0'" setup.py; then
    echo 'hi'
  fi

  # Build and upload the package
fi
