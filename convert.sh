#!/bin/sh
rm -rf auc/
mkdir -p auc/
xsltproc tslext.xsl TSLExt.1.0.xml | while read name data ; do
    echo "$data" | base64 -d > auc/$name.crt
done
