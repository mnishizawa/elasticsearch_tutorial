# lets look at the implicit mapping
curl -s -XGET 'http://192.168.5.10:9200/mycollections/book/_mapping?pretty'

#explicitly map so we don't have ambiguity
curl -s -XDELETE 'http://192.168.5.10:9200/mycollections/book'
curl -s -XPUT 'http://192.168.5.10:9200/mycollections/book/_mapping' -d '{
   "properties": {
      "author": { 
        "type": "string" 
      },
      "categories": { 
        "type": "string" 
      },
      "in_print": { 
        "type": "boolean" 
      },
      "pages": { 
        "type": "integer" 
      },
      "title": {
        "type": "string", 
        "index": "not_analyzed" 
      }
    }
}'

# exercise some of the other implicit mappings
curl -s -XPUT 'http://192.168.5.10:9200/mycollections/music/1' -d'{
  "title"      : "Free Bird",
  "songwriter"  : ["Ronnie Van Zant", "Allen Collins"],
  "track_length": "9:06",
  "length_in_mins" : 9.10,
  "time_signature"  : "4/4",
  "has_guitar_solo" : true,
  "release_date"    : "1974-11-20",
  "us_peak_position": 19,
  "categories" : ["southern","rock","classic"]
}'

# now take a look at the auto mapping
curl -s -XGET 'http://192.168.5.10:9200/mycollections/music/_mapping?pretty'

