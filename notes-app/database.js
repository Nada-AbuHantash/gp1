//////////////////// view table////////////////
// const {
//     createPool
// }= require('mysql');
// const pool= createPool({
// host: "localhost",
// user:"root",
// password:"",
// database:"test",
// connectionLimit:10

// })
// pool.query(`select * from nada ` ,(err,result,fileds)=>{
//     if(err){
//         return console.log(err);
    
//     }
//     return console.log(result);
// })


////////////////// insert///////////////
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "test"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  //Insert a record in the "customers" table:
  var sql = "INSERT INTO nada (name, pass) VALUES ('doha', 'doha')";
  con.query(sql, function (err, result) {
    if (err)console.log(err); //throw err;
    console.log("1 record inserted");
  });
});


///////////////////// insert frome web but not work 100% //////////////
// var express = require('express');
// var app = express();
// // var ejs = require('ejs');
// var mysql = require('mysql');
// // var bodyParser = require('body-parser');
// // app.use(bodyParser.urlencoded({ extended: true })); 
// var HOST = 'localhost';
// var PORT = 3000
// var MYSQL_USER = 'root';
// var MYSQL_PASS = '';
// var DATABASE = 'test';
// var TABLE = 'nada'; 

// var mysql = mysql.createConnection({
// host: HOST,
// port: PORT,
// user: MYSQL_USER,
// password: MYSQL_PASS,
// });
// mysql.connect();
// // app.get('/home',function(req,res,next){
// // res.sendfile('views/forms.html');
// // });
// app.post('/forms.html', function(req, res) {
// console.log('req.body');
// console.log(req.body);
// res.write('You sent the name "' + req.body.name+'".\n');
// res.write('You sent the Email "' + req.body.pass+'".\n');
// res.write('You sent the City "' + req.body.abc+'".\n');
// res.write('You sent the Pincode "' + req.body.id+'".\n');
// res.end()

// mysql.query("Insert into "+TABLE+" (name,pass,abc,id) VALUES ('"+req.body.name+"','"+req.body.pass+"','"+req.body.abc+"','"+req.body.id+"')",function(err, result)      
// {                                                      
//     if (error) { return sendResponse(500, 'Ahhhhhhh!'); }
// });
// });
// app.listen(3000);
// console.log('Example app listening at port:3000');