#!/bin/bash

# close couchdb background process
couchdb -d

COUCH=http://admin:password@127.0.0.1:5984
curl -X DELETE $COUCH/registry

# delete data and logs
cd $(dirname $0)

cat couch/{couch,stdout,stderr}.log

cat couch/pid | xargs kill
rm -rf couch
rm -rf data
