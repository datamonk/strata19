#!/bin/bash

CWD=$(/bin/pwd -P)
OUTPUT_PREFIX="/path/to/slides/dir"

# Overwrite existing content in slides directory?
# TODO

# Download Oreilly Strata slidedeck web source page. Iterate
# through to parse and download URL paths meeting the file
# extention critera (PDF's, PPT, ZIP). Write to OUTPUT_PREFIX
# directory.
wget 'https://conferences.oreilly.com/strata/strata-ca/public/schedule/proceedings' && cat ${CWD}/proceedings | grep '.ppt\|.pptx\|.pdf\|.zip' | cut -d'"' -f2 | while read line; do wget "${line}" --directory-prefix=${OUTPUT_PREFIX}; done < "${1:-/dev/stdin}"

# Fix garbage chars and whitespace in filenames
detox -s iso8859_1 -v ${OUTPUT_PREFIX}/*.[pz][pdi][tfp]*

# Cleanup web source file
rm -f ${CWD}/proceedings
