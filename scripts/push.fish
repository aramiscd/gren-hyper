#!/usr/bin/env fish

set repo gren-hyper

git push origin $argv
git push origin --tags

git push git@git.sr.ht:~aramis/$repo $argv
git push git@git.sr.ht:~aramis/$repo --tags

git push git@github.com:aramiscd/$repo $argv
git push git@github.com:aramiscd/$repo --tags
