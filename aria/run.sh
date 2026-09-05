#!/usr/bin/env bashio
# Start Aria with persistent storage in /data.
#
# By default it serves its own self-signed HTTPS on 8421, which is what the
# microphone needs. If the ssl option is on, the certificate from /ssl is used
# instead - the Home Assistant convention shared with every other add-on.

ARGS="-data /data"

if bashio::config.true 'ssl'; then
    CERT="/ssl/$(bashio::config 'certfile')"
    KEY="/ssl/$(bashio::config 'keyfile')"
    if [ -f "${CERT}" ] && [ -f "${KEY}" ]; then
        bashio::log.info "Using the certificate from ${CERT}"
        ARGS="${ARGS} -cert ${CERT} -key ${KEY}"
    else
        bashio::log.warning "ssl is on but ${CERT} or ${KEY} does not exist; using the self-signed certificate instead"
    fi
fi

exec /usr/bin/aria ${ARGS}
