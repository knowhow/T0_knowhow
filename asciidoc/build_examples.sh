#!/bin/bash

for f in syntax_source.aux syntax_source.cb syntax_source.dvi syntax_source.glo syntax_source.idx syntax_source.log syntax_source.out syntax_source.pdf syntax_source.tex syntax_source.toc; do
   echo rm $f
   rm $f
done

if [ "$1" == "1" ]; then 
echo varijanta 1 - a2x, dblatex pdf

a2x -v -f pdf syntax_source.asc
exit 0
fi

if [ "$1" == "2" ]; then 
echo varijanta 2 - a2x - latex, latex -> dvi, dvipdf

a2x -v -f tex syntax_source.asc
latex syntax_source.tex
dvipdf syntax_source.dvi

exit 0
fi

echo odaberi jednu od varijanti: $0 \<1 ili 2\>
