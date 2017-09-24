Здесь размещены (или готовятся после сборки пакета) следующие наборы сертификатов:

guc — сертификаты головных удостоверяющих центров
ca-gost-bundle.crt — бандл сертификатов

После настройки системного openssl согласно
https://www.altlinux.org/ГОСТ_в_OpenSSL

и добавления файла ca-gost-bundle.crt к /usr/share/ca-certificates/ca-bundle.crt
openssl и xmlsec начинают полноценно работать с сертификатами.

Официальный источник информации:
https://e-trust.gosuslugi.ru
