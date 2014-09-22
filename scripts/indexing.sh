# create an index
curl -s -XPUT 'http://localhost:9200/mycollections'

# create a document
curl -s -XPUT 'http://localhost:9200/mycollections/book/1' -d '{
  "title"  : "Lord of the Rings: Fellowship of the Ring",
  "author" : "J.R.R. Tolkien",
  "pages"  : 430
}'

# make sure it's there
curl -s -XGET 'http://localhost:9200/mycollections/book/1' 

#versioning - we made a mistake, pages should be 432
curl -s -XPUT 'http://localhost:9200/mycollections/book/1' -d '{
  "title"  : "Lord of the Rings: Fellowship of the Ring",
  "author" : "J.R.R. Tolkien",
  "pages"  : 432
}'

#getting it again reveals that it has a new version number
curl -s -XGET 'http://localhost:9200/mycollections/book/1' 

#delete the document
curl -s -XDELETE 'http://localhost:9200/mycollections/book/1' 

