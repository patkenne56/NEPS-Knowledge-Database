var express = require('express');
var app = express();
var fs = require('fs');
app.get('/', function(request, response,err){
  var html = fs.readFileSync('./KBSkeleton.html', 'utf8');response.send(html);
}).listen(5002, function(){
  console.log("Listening on port 8080");
});
