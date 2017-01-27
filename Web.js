var express = require('express');
var app = express();
var fs = require('fs');
var ejs = require('ejs');
app.engine('html',require('ejs').renderFile);
var DBWrapper = require('node-dbi').DBWrapper;
var db = new DBWrapper('sqlite3', {'path':'./KnowledgeDatabase.db'});
app.set('view engine', 'ejs');

app.get('/', function(request, response,err){
  response.render('KBSkeleton.html');
}).listen(8080, function(){
  console.log("Listening on port 8080");
});

app.get('/Articles', function(request, response){
  db.connect(function(err){
    console.log('Connected to DB: ', (!err)?'No Error' : err);
  });
var art = {};
app.get('/Articles',function(req,res)
{connection.query('SELECT * FROM Articles',function(err,result)
{ if(err){
  throw err;
}else{
  res.render('Articles.html',{result:rows});
  console.log(art);
}
});
});

});
