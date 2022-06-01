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

### Elastic and kibana
The tool is now updated to also send the logs into elasticsearch for more data filtering.
The parser take the logs and parse then into the output folder in json format. This files can then be added to many diffrent tools for process.
In this project we att a new fluentd that reads the logs and store them into elasticsearch.

We then load a kibana for you to search in the logs.

#### Where are the indices
The indices is called logstash- and then that year and date.
So if you add more datata you can always delete the last date indece and keep track.



Setup index pattern
```
http://localhost:5601/app/management/kibana/indexPatterns
```
pattern
```
logstash-*
```



To access kibana go to

```
http://localhost:5601
```



Remember we are using the events log as refernce so you need to set the date to show the events time.