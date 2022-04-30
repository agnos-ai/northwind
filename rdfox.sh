#!/usr/bin/env bash

# This code runs inside the container as the entrypoint specified in the Dockerfile

# if [[ -z "${RDFOX_LICENSE_BASE64}" ]] ; then
#   echo "ERROR: Create an environment variable RDFOX_LICENSE_BASE64 that has the base64 encoded content of your RDFox license"
#   exit 1
# fi

# # Server directory = /home/rdfox/.RDFox
# # Lincense must be copied to the location where RDFox executable will be running -> /opt/RDFox/RDFox.lic
# echo "${RDFOX_LICENSE_BASE64}" | base64 -d > /home/rdfox/RDFox.lic

# Start RDFox Server
exec /opt/RDFox/RDFox -server-directory /home/rdfox/.RDFox \
-license-file /home/rdfox/RDFox.lic -role "${RDFOX_USER}" -password "${RDFOX_PASSWORD}" \
shell . "set endpoint.port ${RDFOX_PORT}" "endpoint start"

