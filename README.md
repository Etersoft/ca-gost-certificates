Здесь размещены (или готовятся после сборки пакета) следующие наботы сертификатов:

guc — сертификаты головного удостоверяющего центра
auc — сертификаты удостоверяющих центров
crl - списки отозванных сертификатов
crl.list — список идентификаторов ключа и URL со списками отозванных сертификатов
crl.url.failed.list — список идентификаторов ключа и URL, для которых не удалось скачать отозванные сертификаты
ca-gost-bundle.crt — бандл сертификатов


После настройки системного openssl согласно
https://www.altlinux.org/ГОСТ_в_OpenSSL

и добавления файла ca-gost-bundle.crt к /usr/share/ca-certificates/ca-bundle.crt
openssl и xmlsec начинают полноценно работать с сертификатами.

Официальный источник информации:
https://e-trust.gosuslugi.ru
