# Set the base image to Ubuntu
FROM ubuntu

ENV DEVUSER pickles
ENV DEVUID 1995
ENV DEVGID 1995
ENV EXTGID 1999

# Create user
RUN useradd -m --shell /bin/bash -u $DEVUID $DEVUSER 

# USER $DEVUSER
ENV WD /home/${DEVUSER}
WORKDIR ${WD}

# Put the entrypoint script somewhere we can find
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

