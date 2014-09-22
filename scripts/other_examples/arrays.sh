
# Add a book again, this time with some categories
curl -s -XPUT 'http://192.168.5.10:9200/mycollections/book/1' -d '{
  "title"      : "Lord of the Rings: Fellowship of the Ring",
  "author"     : "J.R.R. Tolkein",
  "pages"      : 432,
  "categories" : ["fiction","fantasy","classics"]
}'

# Search for sets of matching categories using a term filter
curl -s -XGET 'http://192.168.5.10:9200/mycollections/book/1' -d '{
  "query":{
    "match_all":{}
    },
    "filter":{
      "term":{"categories":["fiction","classics"] }
      }
}'



