FROM  fluent/fluentd:v1.14

USER root
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev geoip-dev  libmaxminddb-dev 
RUN apk add --no-cache libstdc++ 
RUN gem install elasticsearch -v 7.6 
RUN fluent-gem install fluent-plugin-elasticsearch:5.2.2 \
 && sudo fluent-gem install fluent-plugin-docker \
 && sudo gem install \
        fluent-plugin-grok-parser \
 && sudo gem install \
	 fluent-plugin-multi-format-parser \
 && sudo gem install \
        fluent-plugin-kafka \
 && sudo gem install \
        fluent-plugin-route \
 && sudo gem install \
        fluent-plugin-rewrite-tag-filter \
 && sudo gem install \
        fluent-plugin-s3 \        
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem

USER fluent

EXPOSE 24284

