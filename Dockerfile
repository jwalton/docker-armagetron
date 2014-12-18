# Armagetron dedicated server

# Use precise, because there are no images in the Armagetron PPA for trusty.
FROM ubuntu:precise

# Install Armagetron
RUN \
    apt-get update && \
    apt-get install -y python-software-properties && \
    add-apt-repository ppa:armagetronad-dev && \
    apt-get update && \
    apt-get install -y armagetronad-dedicated && \
    service armagetronad-dedicated stop

CMD /usr/games/armagetronad-dedicated

# Port for server
EXPOSE 4534/udp

