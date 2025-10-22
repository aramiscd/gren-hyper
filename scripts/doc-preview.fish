#!/usr/bin/env fish

npx npm install --loglevel=error --no-audit --no-fund gren-packages
npx gren-doc-preview
