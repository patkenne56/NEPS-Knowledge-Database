var express = require('express');
var app = express();
var fs = require('fs');
app.get('/', function(request, response,err){
  var html = fs.readFileSync();
  response.send(html);

}).listen(3000, function(){
  console.log("Listening on port 8080");
});
