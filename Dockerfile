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
CMD python3 /home/odoo/src/odoo/odoo-bin --database=$DB_NAME --db_host=$DB_HOST --db_port=5432 --db_user=$DB_USER --db_password=$POSTGRES_PASSWORD --http-port=$PORT
