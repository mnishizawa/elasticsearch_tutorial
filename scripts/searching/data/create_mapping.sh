curl -s -XPUT 'http://192.168.5.10:9200/test/member/_mapping' -d '{
  "properties": {
    "dob": {
      "type": "string"
    },
    "firstname": {
      "type": "string"
    },
    "gender": {
      "type": "string"
    },
    "id": {
      "type": "string"
    },
    "lastname": {
      "type": "string"
    },
    "member_since": {
      "type": "date",
      "format": "dateOptionalTime"
    }
  }
}'
