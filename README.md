# RDFox Rules on Northwind


## Introduction

This repository will spin a RDFox server with the Northwind data store. 
You will need to have Docker running on your local machine. Please visit the official Docker website to download and install Docker. 
For detailed information on the Northwind sample data store, please refer to the following article:
https://medium.com/agnos-ai/northwind-sql-vs-sparql-de662f2e0e7b


## License

This Docker container checks for the existence of an RDFox.lic license file in the repository home directory: `/northwind/home/RDFox.lic`. 
Visit RDFox website to request a trial license and copy it to the location specified above on your local machine.


## Host pre-requisites

### MacOS

You must have **Homebrew** and **Curl** installed on the host computer in order to be able to run the exercises in this demo. Please, follow the instructions on this [web site](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux) to install those tools on Windows, MacOS, and Linux.

### Windows
TODO

## Running the container

### Usage
For help using the local-run.sh command, execute the following in your terminal:

`./local-run.sh -help `


To run the container, execute the command below in your terminal:

`./local-run.sh -u "admin" -p "admin" `


## Exercises

After the container is running, you will be able to browse to the RDFox console using the following URL.

` http://localhost:12110/console/ `

Execute SPARQL queries before and after each rule is added.

Queries and rules can be found under their respective folders in this repository. Note that the rule used in each query is specified in the query name. 

### Adding a rule
The command to add the rule can be found inside each rule dlog file.

## Cleaning up the local environment
This following command will stop and remove all containers, remove all images, and delete all Volumes. 

`./local-cleanup.sh`


TODO: Document queries, rules and diagrams here
