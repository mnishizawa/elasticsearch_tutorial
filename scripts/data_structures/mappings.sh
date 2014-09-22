#create a new type in the index
curl -s -XPUT 'http://192.168.5.10:9200/mycollections/music/1' -d'{
  "title"      : "Free Bird",
  "songwriter"  : ["Ronnie Van Zant", "Allen Collins"],
  "track_length": "9:06",
  "length_in_mins" : 9.10,
  "time_signature"  : "4/4",
  "has_guitar_solo" : true,
  "release_date"    : "1974-11-20",
  "us_peak_position": 19,
  "categories" : ["fiction","fantasy","classics"]
}'

# now take a look at the auto mapping
curl -s -XGET 'http://192.168.5.10:9200/mycollections/music/_mapping?pretty'
