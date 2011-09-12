FOP_HOME=/usr/local/Cellar/fop/1.0/libexec
echo $1 to $2

java -cp $FOP_HOME/build/fop.jar:$FOP_HOME/lib/avalon-framework-4.2.0.jar:$FOP_HOME/lib/commons-logging-1.0.4.jar:$FOP_HOME/lib/commons-io-1.3.1.jar:$FOP_HOME/lib/xalan-2.7.0.jar:$FOP_HOME/lib/xmlgraphics-commons-1.4.jar:$FOP_HOME/lib/serializer-2.7.0.jar org.apache.fop.fonts.apps.TTFReader "$1" "$2"

