# Restore data from S3 into elastic ore other service


The importer has 2 modules the first is a python module that loops over the json files from s3.
It thens matches on the correct namespace and time.
Entries that match are saved into a new file called out.json.


Fluentd reads the out.json file and can then parse it on to Elasticsearch ore any other destination as well



## Setup

### Get s3 Files
Get the json file that you want to search in and place them in the input folder.
All files in the input folder will be parsed.


### Setup filter to find the correct logs

```
    environment:
      - NAMESPACE=booli-se-graphql
      - STARTIME=2022-04-14T09:50:02.241953   # in this format 2022-04-14T09:50:02.241953
      - ENDTIME=2022-04-14T09:51:02.241953    # in this format 2022-04-14T09:51:02.241953
```

You need to set the valus in this format ore else the matching of data will not work



### Setup your end destionation 
Setup fluentd to store the logs in the correct destination


```
    environment:
      - ELASTICSEARCH=http://elasticsearch
      - INDEX=booli-se-imported
```

## Run 

Now you can build the tools with 

```
docker-compose build
```


Then run the tools with


```
docker-compose up
```

## Trubber / testing

You can only run the filter first to verify that the correct logs are extracted.


```
docker-compose run filter
```
