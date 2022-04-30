# RDFox Rules on Northwind

## Introduction

This repository will spin a RDFox server with the Northwind data store. 
You will need to have Docker running on your local machine. Please visit the official Docker web site to download and install Docker. 
For detailed information on the Northwind sample data store, please refer to the following article:
https://medium.com/agnos-ai/northwind-sql-vs-sparql-de662f2e0e7b


## License

This Docker container checks for the existence of an RDFox.lic license file in the home folder. 
Visit RDFox web site to request a trial license and copy it there before running the container. 

`home/RDFox.lic`


## Running the container

### Usage
For help using the local-run.sh command, run the following:

`./local-run.sh -h `


To run the container, execute the command below.

`./local-run.sh -u "admin" -p "admin" `

## Exercises

After the container is running, you will be able to browse to the RDFox console using the following URL.

` http://localhost:12110/console/ `

Execute SPARQL queries before and after each rule is added.

Queries and rules can be found under their respective folders in this repository.


TODO: Document queries and diagrams here

### Adding a rule
To add each rule, execute the following in the command line after replacing the name of the rule:

` curl -X POST -G --data-urlencode "default-graph-name=http://www.mysparql.com/resource/northwind/dataGraph" --user admin:admin -H "Content-Type:" -T "rules/<name-of-the-rule>.dlog" "localhost:12110/datastores/Northwind/content" `

TODO: What the user need to install on each OS to be able to run curl?

## Cleanning up the local environment
This following command will stop and remove all containers, remove all images, and delete all Volumes. 

`./local-cleanup.sh`
