# Incident analys 

The tools has 2 parts that work

### Parser
the parser is the first tool. It reads the data from files and oarse them into json files.
It can read diffrent typs of files and then componed them into a shared file and a insynced timestamp for all logs.
the logs will not be in time order but when digest later the logs will be in order



### Uploader
The uploader reads the parsed file from the parser and can then upload the files to any fluent supported storage.
Here we are using a local elasticsearch and kibana to store and search for the logs



## Get started
First install docker and docker-compose to your computer


### the 3 folder you need to keep track off


#### Input
Here is where you add your files that are to be uploaded.

Then base folder can be used to add regular files for apache, nginx and json files.
Then iis folder is for iis files
The ws02 is for ws02 log files


If you dont now add files into the base fodler and run to parser to test the output.


```
docker-compose run parser
```


#### Output
Here is where the ready file will come. The fluent will flush the buffer so it can be soem time before logs come up. 


#### State
The state keeps track of the state of the folder so you can add new file and run ta parser and it will onlye read the latest files.
If you remove all files in the state folder you will start to parse all files form start.


