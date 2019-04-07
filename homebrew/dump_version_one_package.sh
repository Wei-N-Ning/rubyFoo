#!/usr/bin/env bash

: <<"TEXT"
motivation:
to dump the version of a package that was installed from head
without affecting other packages (regardless they were installed 
from stable versions or head versions)

source: https://discourse.brew.sh/t/brew-upgrade-fetch-head-in-config/123

upgrade one version
https://stackoverflow.com/questions/4523920/how-do-i-update-a-formula-with-homebrew

CA work:
https://github.com/Canva/homebrew-packages/pull/69
TEXT

brew upgrade --fetch-HEAD infra-foo 
#            ^^^^^^^^^^^^^^^^^^^^^^

brew upgrade url://...
#            ^^^^^^^^^




