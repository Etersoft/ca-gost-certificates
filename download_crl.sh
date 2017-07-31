#!/bin/sh
rm -f crl.list.tmp
xsltproc tslext-crl.xsl TSLExt.1.0.xml | sort -u >crl.list
rm -rf crl/
mkdir -p crl/
rm -f crl.url.failed.list
cat crl.list | while read name url ; do
    wget --tries 2 "$url" -O "crl/$name-$(basename "$url")" || echo "$name $url" >>crl.url.failed.list
done

echo "Failed URL list:"
cat crl.url.failed.list
