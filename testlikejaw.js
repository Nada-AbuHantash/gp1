const mysql = require("mysql");
const util = require("util");
var express = require('express');
var app       = express();
var bodyparser=require('body-parser');
app.use(express.json());
app.use(bodyparser.urlencoded({extended: true}));
var TABLE = 'customer';
const pool = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'gp1',
    
  
  });

  console.log("hii");
  pool.connect();

  app.post('/infouser', function(request, response){
    console.log("information");
    var email=request.body.useremail;
    var pass=request.body.userpass;
    console.log(request.body.useremail);
    console.log("okkkkkkkkkk");
    
    let query1="Select * from customer where useremail=? and userpass=?";

    pool.query(query1,[email,pass],function(error,results){
        if ( error ){
            response.status(400).send('Error in database operation');
        } else {
            response.send(results);
        }
    });
});

//   app.post('/infouser', function(request, response){
//     console.log("information");
//     var email=request.body.useremail;
//     var pass=request.body.userpass;
    
//     console.log(request.body.useremail);
//     console.log("okkkkkkkkkk");
//     //let query1 = "INSERT INTO nada (name,pass,abc,id) VALUES('"+name+"','"+pass+"','"+abc+"','"+id+"') ";
//     let query1="Select * from customer where useremail=? and userpass=?";

//     pool.query(query1,[useremail,userpass],function(error,data,results){
//         if ( error ){
//             response.status(400).send('Error in database operation');
//         } else {
//             if(data.length> 0 )
//              {console.log(data);
//             response.status(200);}
//             else{response.status(400).send("not found in database");}
//         }
//     });
// });


app.post('/register', function(request, response){
    console.log("sgin");
    var username=request.body.username;
    var userpass=request.body.userpass;
    var useremail=request.body.useremail;
    var userphone=request.body.userphone;
    var userplace=request.body.userplace;
    console.log(request.body.userplace);
    console.log("okkkkkkkkkk");
    let query1 = "INSERT INTO customer (username,useremail,userpass,userphone,userplace) VALUES('"+username
    +"','"+useremail+"','"+userpass+"','"+userphone+"','"+userplace+"') ";
    //let query1="Select * from nada where name=? and pass=?";
    
    pool.query(query1,[username,useremail,userpass,userphone,userplace],function(error,data,results){
        console.log("done qurey");
        
        // if (error || error.code=="ER_DUP_ENTRY") {
        //     response.status(400).send("falid");
        //     console.log("falid");
        // }
        if ( error ){
            response.status(400).send('Error in database operation');
        }
        else{
            response.send("Success");

        }
        //return response;
    });
});
app.listen(3000, function () {
    console.log('Express server is listening on port 3000');
});