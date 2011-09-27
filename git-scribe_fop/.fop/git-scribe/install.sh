#!/bin/bash

GEM_PATH=`gem env gemdir`

#ls fo.xsl $GEM_PATH/gems/git-scribe*/docbook-xsl

sed -e s/cmd\ =\ \"fop.*-fo/cmd\ =\ \"fop\ -c\ ~\\/\.fop\\/userconf\.xml\ -fo/g generate.rb > generate_2.rb

#cp -v fo.xsl $GEM_PATH/gems/git-scribe*/docbook-xsl/fo.xsl

grep cmd\ =\ \"fop generate.rb
echo =\>
grep cmd\ =\ \"fop generate_2.rb

cp -av generate_2.rb $GEM_PATH/gems/git-scribe*/lib/git-scribe/generate.rb
