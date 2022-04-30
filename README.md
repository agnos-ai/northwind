# rdfox

This Docker container checks for the existence of an RDFox.lic license file in the home folder. 
Visit RDFox web site to request a trial license and copy it to that folder.

`home/RDFox.lic`

Running the container

`./local-run.sh -u "admin" -p "admin" `


Cleaning up the local environment

`./local-cleanup.sh`

Usage

`./local-run.sh -h `


Exercises

Rules

Query all customers that bought an specific product

```
 
```

Add rule

` curl -X POST -G --data-urlencode "default-graph-name=http://www.mysparql.com/resource/northwind/dataGraph" --user admin:admin -H "Content-Type:" -T "rules/boughtProduct.dlog" "localhost:12110/datastores/Northwind/content" `

