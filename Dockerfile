FROM oxfordsemantic/rdfox:5.6

USER root
RUN apt-get install --yes bash

RUN mkdir /home/rdfox/.RDFox && chown rdfox /home/rdfox/.RDFox

COPY rdfox.sh /home

ENTRYPOINT [ "/usr/bin/bash", "-C", "/home/rdfox.sh" ]

USER rdfox