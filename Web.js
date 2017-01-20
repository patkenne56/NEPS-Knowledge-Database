var express = require('express');
var app = express();

app.get('/', function(request, response,err){
  response.send('NEPS Knowledge Base!');
}).listen(3000, function(){
  console.log("Listening on port 8080");
});
