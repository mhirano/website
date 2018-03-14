#!/bin/bash

for file in `\find . -maxdepth 1 -name '*.md'`; do
  sed -i -e '/^id/d' $file
  sed -i -e '/^author/d' $file
  sed -i -e '/^layout/d' $file
  sed -i -e '/^guid/d' $file
  sed -i -e '/^permalink/d' $file
  sed -i -e '/^tikva_featured_post/d' $file
  sed -i -e '/- _0$/d' $file
done

for file in `\find . -maxdepth 1 -name '*.md-e'`; do
  rm $file
done
