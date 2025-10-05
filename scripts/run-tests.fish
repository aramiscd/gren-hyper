#!/usr/bin/env fish

builtin cd tests
and npx gren make Main --output=run-tests
and node run-tests
