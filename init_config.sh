#!/bin/sh

if [ ! -e ./lib/config.ml ]; then
  cp ./lib/config.ml.in ./lib/config.ml
  echo *****************************************************************
  echo If you wish to use the Github API, edit lib/config.ml with your
  echo authorization token.
  echo *****************************************************************
fi
