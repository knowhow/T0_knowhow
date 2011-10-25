#!/bin/sh
#
# This file is part of the xTuple ERP: PostBooks Edition, a free and
# open source Enterprise Resource Planning software suite,
# Copyright (c) 1999-2011 by OpenMFG LLC, d/b/a xTuple.
# It is licensed to you under the Common Public Attribution License
# version 1.0, the full text of which (including xTuple-specific Exhibits)
# is available at www.xtuple.com/CPAL.  By using this software, you agree
# to be bound by its terms.


PROG=`basename $0 .sh`
PROGDIR=`dirname $0`
OUTPUTDIR=${TMPDIR:-/tmp}/${PROG}_$$.tmp
OUTPUTFILE=

function usage() {
  echo "usage:"
  echo "$PROG -h"
  echo "$PROG [ -o outputfile ] report-definition.xml [ ... ]"
}

ARGS=`getopt ho: $*`
if [ $? != 0 ] ; then
  usage
  exit 1
fi

set -- $ARGS

while [ "$1" != -- ] ; do
  case "$1" in
    -h) usage
        exit 0
        ;;
    -o) OUTPUTFILE=$2
        shift
        ;;
    *)  echo "$PROG: unrecognized argument $1"
        usage
        exit 1
        ;;
  esac
  shift
done
shift #past the --

if [ -z "$*" ] ; then
  echo "$PROG: expecting input files"
  usage
  exit 1
fi

mkdir $OUTPUTDIR                                                      || exit 2

for REPORTXML in $* ; do
  xsltproc "$PROGDIR"/context.xsl $REPORTXML > $OUTPUTDIR/`basename $REPORTXML`  || exit 3
done

# how can we consolidate the two cases?
if [ -n "$OUTPUTFILE" ] ; then
  (
  echo '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE TS >
<TS version="2.0">' ;
  cat $OUTPUTDIR/* | sed -e '/<?xml version/d' -e 's/^/  /' ;
  echo '</TS>'
  ) > $OUTPUTFILE
else
  echo '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE TS >
<TS version="2.0">'
  cat $OUTPUTDIR/* | sed -e '/<?xml version/d' -e 's/^/  /'
  echo '</TS>'
fi

rm -rf $OUTPUTDIR

exit 0
