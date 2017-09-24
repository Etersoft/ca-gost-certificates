#!/bin/sh
rm -rf guc-pem/
mkdir -p guc-pem/

print_cert()
{
    local name="$1"
    local file="$2"
    printf '#\n# %s\n#\n\n' "$name"
    openssl x509 -inform der -sha256 -nameopt utf8 -in $file -text -fingerprint
    printf '\n\n'
}

rm -f ca-gost-bundle.crt
for f in guc/*.crt; do
    name=$(basename $f .crt)
    print_cert $name $f > guc-pem/$name.pem
    cat guc-pem/$name.pem >>ca-gost-bundle.crt
done

c_rehash guc-pem/