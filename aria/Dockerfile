ARG BUILD_FROM
FROM ${BUILD_FROM}

# The binary is prebuilt per architecture; nothing is compiled here.
ARG BUILD_ARCH
COPY bin/aria_${BUILD_ARCH} /usr/bin/aria
COPY run.sh /run.sh
RUN chmod +x /usr/bin/aria /run.sh

CMD ["/run.sh"]
