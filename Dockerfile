FROM ghcr.io/cloudnative-pg/postgresql:14.5-12

USER root

# Install deps
RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        wget lsb-release ;\
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;


# Install pgaudit
RUN set -xe; \
echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/timescaledb.list; \
    wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add - ; \
    apt-get update; \
    apt-get install -y timescaledb-2-postgresql-14='2.7.2*' timescaledb-2-loader-postgresql-14='2.7.2*'; \
    rm -fr /tmp/* ; \
    rm -rf /var/lib/apt/lists/*;

USER 26

