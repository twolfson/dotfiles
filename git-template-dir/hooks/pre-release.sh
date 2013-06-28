#!/bin/sh
# npm
if test -f package.json; then
  node -e "f = './package.json'; p = require(f); p.version = process.argv[1]; require('fs').writeFileSync(f, JSON.stringify(p, null, 2));" $2
fi

# Sublime Package Control
if test -f packages.json; then
  node -e "f = './packages.json'; p = require(f); pkg = p.packages[0]; pkg.last_modified = new Date().toISOString().replace('T', ' ').replace(/\.\d{3}Z/, ''); pkg.platforms['*'][0].version = process.argv[1]; require('fs').writeFileSync(f, JSON.stringify(p, null, 2));" $2
fi
