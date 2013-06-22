if [ test -f package.json ]; then
  node -e "f = './package.json'; p = require(f); p.version = process.argv[1]; require('fs').writeFileSync(f, JSON.stringify(p, null, 2));" $2
fi
