Docker container for running an [Armagetron](http://armagetronad.org/) server.

This spins up an Ubuntu Precise image and installs an Armagetron dedicated server on it from
the [Armagetron PPA](http://wiki.armagetronad.org/index.php?title=Ubuntu_Installation#Quick_and_Lazy:_use_binaries_from_our_PPA).

## Quick start:

    sudo docker run -d -p 4534:4534/udp --name armagetron jwalton/armagetron

## The long version:

First, we want to set up our configuration files somewhere persistent:

    mkdir -p /opt/armagetron
    sudo docker run --rm -it -v /opt/armagetron:/opt/armagetron \
        jwalton/armagetron sh -c 'cp -R /etc/armagetronad/* /opt/armagetron'

Then, run the armagetron server:

    sudo docker run -d -p 4534:4534/udp --name armagetron \
        --restart=always \
        -v /opt/armagetron:/etc/armagetronad \
        jwalton/armagetron

Logs are just written to stdout, so if you don't care about logs (or you want them)