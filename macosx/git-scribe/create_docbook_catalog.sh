#!/bin/bash


INSTALL_DIR=~/.asciidoc
if [ -d "$INSTALL_DIR" ]; then
	echo postoji direktorij $INSTALL_DIR. prekidam operaciju
    exit 1
else
   mkdir $INSTALL_DIR
fi

TMP_DIR=/tmp/asciidoc_docbook
mkdir $TMP_DIR
cd $TMP_DIR
rm $TMP_DIR/*

echo http://groups.google.com/group/asciidoc/browse_thread/thread/142f9e3b053cad88
echo mac osx x install docbook for asciidoc

brew install wget

wget http://www.docbook.org/xml/4.5/docbook-xml-4.5.zip
wget http://sourceforge.net/projects/docbook/files/docbook-xsl/1.76.0/docbook-xsl-1.76.0.zip



cd $INSTALL_DIR
unzip $TMP_DIR/docbook-xml-4.5.zip -d docbook-xml-4.5
unzip $TMP_DIR/docbook-xsl-1.76.0.zip
cd docbook-xsl-1.76.0
bash install.sh --batch

echo kreiram /etc/xml/catalog

echo slijedi upit za password za sudo komandu ...

sudo mkdir /etc/xml
sudo chown $USER /etc/xml
xmlcatalog --create > /etc/xml/catalog
xmlcatalog --noout --add public "-//OASIS//DTD DocBook XML V4.5//EN" "file:///Users/$USER/.asciidoc/docbook-xml-4.5/docbookx.dtd" /etc/xml/catalog

echo "dobio sam catalog"
cat /etc/xml/catalog
