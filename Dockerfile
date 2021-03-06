FROM gcr.io/stacksmith-images/minideb:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=lamp \
    BITNAMI_IMAGE_VERSION=7.1.0-r0 \
    PATH=/opt/bitnami/php/bin:$PATH

# System packages required
RUN install_packages libssl1.0.0 libaprutil1 libapr1 libc6 libuuid1 libexpat1 libpcre3 libldap-2.4-2 libsasl2-2 libgnutls-deb0-28 zlib1g libp11-kit0 libtasn1-6 libnettle4 libhogweed2 libgmp10 libffi6 libxslt1.1 libtidy-0.99-0 libreadline6 libncurses5 libtinfo5 libsybdb5 libmcrypt4 libstdc++6 libpng12-0 libjpeg62-turbo libbz2-1.0 libxml2 libcurl3 libfreetype6 libicu52 libgcc1 libgcrypt20 libgssapi-krb5-2 liblzma5 libidn11 librtmp1 libssh2-1 libkrb5-3 libk5crypto3 libcomerr2 libgpg-error0 libkrb5support0 libkeyutils1

# Additional modules required
RUN bitnami-pkg unpack apache-2.4.25-0 --checksum 8b46af7d737772d7d301da8b30a2770b7e549674e33b8a5b07480f53c39f5c3f
RUN bitnami-pkg install libphp-5.6.29-0 --checksum 29fc0f3a08ad7bc23423a1de714c4c598059b3d10e7e33e9f3dff9371e547c33
RUN bitnami-pkg unpack php-7.1.0-1 --checksum 069f80b98b29998601f10685462b2f499cd95c5c56d036b4a3d2b5f64d310028
#RUN bitnami-pkg unpack phpmyadmin-4.6.4-0 --checksum 1c255238fcd51cb0828f27bb572ddbea1d6bb33a5deb52131e220d645f10c14d

COPY rootfs /

VOLUME ["/bitnami/apache", "/bitnami/php", "/bitnami/phpmyadmin"]

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami","start","--foreground","apache"]
