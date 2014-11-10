#!/bin/bash
set -x
DOWNLOAD=false

# Download article
ARTICLE="https://en.wikivoyage.org/wiki/Tokyo/Odaiba"
#wget -O downloaded/Tokyo_Odaiba.html $ARTICLE
DOWLOADED_ARTICLE="downloaded/Tokyo_Odaiba.html"

# Download and relink images
IMAGES=`cat $DOWLOADED_ARTICLE | grep "wikipedia/commons/thumb" | sed -e 's/^.*src="//g' | sed -e 's/" .*$//g'`
for IMAGE in $IMAGES; do
  #wget --directory-prefix=downloaded "http:$IMAGE"
  FILENAME=`echo $IMAGE | sed -e 's/.*\///g'`
  ESCAPED_IMAGE=`echo $IMAGE | sed -e 's#\/#\\\\/#g'`
  echo $FILENAME
  echo $ESCAPED_IMAGE
  sed -i "s/$ESCAPED_IMAGE/file:\/\/\/android_asset\/$FILENAME/g" $DOWLOADED_ARTICLE
done

# Relink wikilinks
# TODO

# Mark external links with special icon
# TODO
