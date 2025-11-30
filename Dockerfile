FROM odoo:19.0

# install system by root user
USER root

# install usrally system package
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
        libldap2-dev \
        libsasl2-dev \
        && \
    rm -rf /var/lib/apt/lists/*

# change to odoo user to run
USER odoo

# Use odoo user to entry system
ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
