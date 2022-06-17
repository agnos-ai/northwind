# RDFox Rules on Northwind


## Introduction

This repository will automatically spin a Docker container with an instance of RDFox server containing the Northwind sample database.


## Host pre-requisites

The automated installation using Docker only works on MacOS. For Windows, you will need to  install and configure RDFox manually. It hasn't been tested on Linux, but it could probably work.
Please visit the official Docker website to download and install Docker for MacOS. 

For more details on the Northwind sample data store, please refer to the following article: 
https://medium.com/agnos-ai/northwind-sql-vs-sparql-de662f2e0e7b

For more details on RDFox reasoning, queries and rules in this repo, please refer to the following article: https://medium.com/agnos-ai/reasoning-with-northwind-16cf3edf3a67


You must have **Homebrew** and **Curl** installed on the host computer in order to be able to run the exercises in this demo. Please, follow the instructions on this [web site](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux) to install those tools on Windows, MacOS, and Linux.


## License

This Docker container checks for the existence of an RDFox.lic license file in the repository home directory: `/northwind/home/RDFox.lic`. 
Visit RDFox website to request a trial license and copy it to the location specified above on your local machine.


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
WARNING! 

The following command will stop and remove all existing containers, images, and volumes on the user's machine.
If you have any other Docker containers in addition to the RDFox ones created by this demonstration, they will be removed, too. 

`./local-cleanup.sh`


## Articles

The articles that use this repository are:

https://medium.com/agnos-ai/reasoning-with-northwind-16cf3edf3a67


