#!/bin/sh

download()
{
    local NOCHECK=
    if [ "$1" = "--no-check-certificate" ] ; then
        NOCHECK="$1"
        shift
    fi
    local filename=$(basename "$1")
    [ -n "$2" ] && filename="$2"
    if [ -s "$filename" ] ; then
        echo "Skipping $1 ..."
        return
    fi
    wget $NOCHECK "$1" -O $filename
}


#mkdir -p certs
#cd certs

# https://lkfl.nalog.ru/lk/cert-info.html
# Установить корневой сертификат УЦ ФНС России
#download http://uc.nalog.ru/crt/CA_FNS_Russia_2015.crt

#cd - >/dev/null

mkdir -p guc
cd guc

# https://e-trust.gosuslugi.ru/MainCA
for i in 8CAE88BBFD404A7A53630864F9033606E1DC45E2 \
         9E78A331020E528C046FFD57704A21B7D2241CB3 \
         538AD264547716302401CDFB316B287DB12BA675 \
         1AF6FCE68CE3F822C6FAD4CB32AD58FF59FBC221 \
         B11108FFDCAD99D7A845023AB552CB1ABE845A1B \
         9D05A704C8C1E565ACDE5878FE0BB96EC53C2A40 \
         0408435EB90E5C8796A160E69E4BFAC453435D1D \
         ; do
    # BUG: gosuslugi has no intermediate COMODO certificate?
    # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=742810
    download --no-check-certificate "https://e-trust.gosuslugi.ru/Shared/DownloadCert?thumbprint=$i" $i.crt
done

cd - >/dev/null

#mkdir -p auc
#cd auc

# http://q.cryptopro.ru/center.htm
#download http://q.cryptopro.ru/qcacer.p7b
#https://e-trust.gosuslugi.ru/Shared/DownloadCert?thumbprint=D24B37FCFBB979D2D4A5D1549EC4E2029D15D8A2
download --no-check-certificate "https://e-trust.gosuslugi.ru/CA/DownloadTSL?schemaVersion=0" TSLExt.1.0.xml
