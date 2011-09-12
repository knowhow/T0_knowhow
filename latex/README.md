http://forums.freebsd.org/showthread.php?t=14633

s/š/\\v{s}/g
s/č/\\v{c}/g
s/Č/\\v{C}/g


\usepackage{xltxtra}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

http://kokice.striga.org/2.2.html

ć \'{c}
đ \dj{}
ž \v{z}

/usr/local/texlive/2011/texmf/web2c/texmf.cnf

ovdje lokalne promjene: /usr/local/texlive/2011/texmf.cnf

TEXMFHOME = ~/Library/texmf
TEXMFVAR = ~/Library/texlive/2011/texmf-var
TEXMFCONFIG = ~/Library/texlive/2011/texmf-config

kpsewhich -var-value TEXMFHOME

=> 

/Users/hernad/Library/texmf

http://www.tex.ac.uk/cgi-bin/texfaq2html


$ texconfig conf

http://mactip.blogspot.com/2009/04/mactex.html

znači svoje stilove stavljamo unutar

~/Library/texmf/tex/latex/dblatex

dblatex i asciidox stilovi:

cp -av /System/Library/Frameworks/Python.framework/Versions/2.6/share/dblatex/latex ~/Library/texmf/tex/latex/dblatex
cp -a -v asciidoc-dblatex.sty ~/Library/texmf/tex/latex/

