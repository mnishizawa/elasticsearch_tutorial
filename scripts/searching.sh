
#search via query parameters
curl -s -XGET 'http://192.168.5.10:9200/test/member/_search?q=firstname:joe&pretty'

# same query using the DSL
curl -s -XPOST 'http://192.168.5.10:9200/test/member/_search?pretty' -d '{
    "query": {
      "match": {
        "firstname": "joe"
      }
    }
}'

# combine queries and filters
curl -s -XPOST 'http://192.168.5.10:9200/test/member/_search?pretty' -d '{
    "query": {
      "filtered": {
        "query": {
          "bool": {
            "should": [ 
                { "match": { "firstname": "joe" } }, 
                { "match": { "firstname": "mike" } } 
            ]
          }
        },
        "filter": {
          "term": { "gender": "male" }
        } 
      } 
    } 
}'

#If you expect a query to match a record and it doesn't, run explain against a record to see why
curl -s -XPOST 'http://192.168.5.10:9200/test/member/1/_explain?pretty' -d '{
   "query": {
      "filtered": {
         "query": {
            "bool": {
               "should": [ { "match": { "firstname": "joe" } }, { "match": { "firstname": "mike" } } ]
            }
         },
         "filter": {
            "term": { "gender": "male" }
         } 
      } 
  } 
}'

#search with aggregations
curl -s -XPOST 'http://192.168.5.10:9200/test/member/_search?pretty' -d '{
 "aggs" : {
   "members_over_time" : {
      "date_histogram" : {
          "field":"member_since",
          "interval":"year"
       }
    }
  }
}'

