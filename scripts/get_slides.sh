#!/bin/bash

wget 'https://conferences.oreilly.com/strata/strata-ca/public/schedule/proceedings' && cat proceedings | grep '.ppt\|.pptx\|.pdf\|.zip' | cut -d'"' -f2 | while read line; do wget "$line"; done < "${1:-/dev/stdin}"
