#!/bin/sh
rm -rf auc/
mkdir -p auc/

print_cert()
{
    local name="$1"
    local file="$2"
    printf '#\n# %s\n#\n\n' "$name"
    openssl x509 -inform der -sha256 -nameopt utf8 -in $file -text -fingerprint
    printf '\n\n'
}

rm -f ca-gost-bundle.crt
xsltproc tslext.xsl TSLExt.1.0.xml | while read name data ; do
    echo "$data" | base64 -d > auc/$name.crt
    print_cert $name auc/$name.crt >>ca-gost-bundle.crt
done
