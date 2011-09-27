#!/bin/bash

echo ascii doc
cp -av lang-bs.conf /usr/local/etc/asciidoc/lang-bs.conf
cp -av asciidoc-dblatex.xsl /usr/local/etc/asciidoc/dblatex/asciidoc-dblatex.xsl

echo dblatex lang.xsl

sudo cp -av lang.xsl /System/Library/Frameworks/Python.framework/Versions/2.6/share/dblatex/xsl
