#!/bin/bash

find ./docs -type f -exec file --mime-type {} + | grep -E 'image/.+' | cut -d: -f1

echo
echo
echo -n "Total images: "
find ./docs -type f -exec file --mime-type {} + | grep -E 'image/.+' | wc -l
