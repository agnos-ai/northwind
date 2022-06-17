#!/usr/bin/env bash

source ./terminal.sh
customize_terminal_output

help()
{
   # Display Help
   echo 
   echo "${header}******************** Usage ********************${reset}"
   echo   "Usage:"
   echo   "   ./local-run.sh [OPTIONS]"
   echo   "   Starts an RDFox container with the Northwind sample data store."
   echo 
   echo   "Options:"
   echo   "   -u  User."
   echo   "   -p  Password."
   echo   "   -r  HTTP port number."
   echo   "   -t  Repository type: par-simple-nn, par-simple-nw, par-simple-ww, par-complex-nn, par-complex-nw, par-complex-ww. Refer to the RDFox documentation for more details."
   echo   "   -h  Help."
   echo
   exit 0
}

while getopts ":u:p:r:t:h:" opt; do
  case $opt in
    u) user="$OPTARG"
    ;;
    p) password="$OPTARG"
    ;;
    r) port="$OPTARG"
    ;;
    t) repositorytype="$OPTARG" 
    ;;
    h) help
    ;;
    *) 
      echo "${error}ERROR${reset}: Invalid parameter."
      help
    ;;
    u|p|r|t|h)
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done


echo "${header}Validate input parameters${reset}"

if [[ -z "${repositorytype}" ]] ; then
       repositorytype="par-complex-nn"
fi

if [[ -z "${port}" ]] ; then
       port="12110"
fi

if [[ -z "${user}" ]] || [[ -z "${password}" ]] ; then
  echo "${error}ERROR${reset}: A mandatory parameter is missing."
  help
fi

echo "user: "$user
echo "password: "$password
echo "port: "$port
echo "repositorytype: "$repositorytype
echo "Parameter validation complete. "


echo "${header}Build Image${reset}"
./local-build.sh || exit $?


echo "${header}Run container and start RDFox server${reset}"
{ 
  # cap-drop ALL: oxfordsemantic/rdfox repositoryname have been designed to run with no superuser capabilities
  docker run --rm --cap-drop ALL --name rdfoxcontainer \
  --env RDFOX_USER=${user} \
  --env RDFOX_PASSWORD=${password} \
  --env RDFOX_PORT=${port} \
  --env RDFOX_REPOSITORYTYPE=${repositorytype} \
  -v $(pwd)/data:/home/rdfox/data \
  -v $(pwd)/ontology:/home/rdfox/ontology \
  -v $(pwd)/home:/home/rdfox \
  -p 12110:12110 $(< image.id)
}& # Start the RDFox Container in the background


echo "${header}Create the Northwind sample data store${reset}"

test=1
while [ ${test} != 0 ]; do
  # It will try to connect to the server every second until the server is available. Failed attempts to connect will not throw errors.
  curl -X POST --user "${user}":"${password}" "localhost:${port}/datastores/Northwind?type=${repositorytype}" 2>/dev/null
  test="${?}"
  sleep 0.5
done


# Grant full access to all downloaded data files and ontologies, rules and queries.
chmod -R u+rwx ./


# Import Northwind data into the dataGraph
curl -X POST -G \
--data-urlencode "default-graph-name=http://www.mysparql.com/resource/northwind/graph/dataGraph" \
--user "${user}":"${password}" "localhost:${port}/datastores/Northwind/content" -H "Content-Type:" -T "data/northwind.nt"



# TODO: Create Rules



# TODO: Create a Northwind Ontology
# Import Northwind Ontology
# curl -X POST -G \
# --data-urlencode "default-graph-name=http://www.mysparql.com/resource/northwind/ontology" \
# --user "${user}":"${password}" -H "Content-Type:text/turtle" -T "ontology/northwind-ontology.ttl" \
# "localhost:${port}/datastores/Northwind/content" 



# TODO: Create Axioms
# Axioms
# curl PATCH --user "${user}":"${password}" -H "Content-Type:" "localhost:${port}/datastores/Northwind/content?operation=add-axioms&source-graph-name=dataGraph&destination-graph-name=axiomGraph"
# curl PATCH --user "admin":"admin" "localhost:12110/datastores/Northwind/content?operation=add-axioms&source-graph-name=#data&destination-graph-name=axiomGraph"



echo "${header}List data stores created${reset}"
curl -X GET --user "${user}":"${password}" "localhost:${port}/datastores"


echo "${header}******************* THE END *******************${reset}"


