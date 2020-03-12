#!/bin/sh

export TAGOKLISTA=data/onkentesek/onkentesek.lst
export TAGOKDIR=data/onkentesek/
if [ -n "${2}" ]; then
  export STR_MUNKATARSAINK="Volunteers"
else
  export STR_MUNKATARSAINK="Önkéntesek"
fi

scripts/tagok.sh $*
