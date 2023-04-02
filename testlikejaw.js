


const mysql = require("mysql");
const util = require("util");
var express = require('express');
var app = express();
var bodyparser = require('body-parser');
app.use(express.json());
app.use(bodyparser.urlencoded({ extended: true }));
var TABLE = 'customer';
const pool = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'gp1',


});

console.log("hii");
pool.connect();

app.post('/infouser', function (request, response) {
    console.log("information");
    var email = request.body.useremail;
    var pass = request.body.userpass;
    console.log(request.body.useremail);
    console.log("okkkkkkkkkk");

    let query1 = "Select * from customer where useremail=? and userpass=?";

    pool.query(query1, [email, pass], function (error, results) {
        if (error) {
            response.status(400).send('Error in database operation');
        } else {
            response.send(results);
        }
    });
});
app.post('/logindelivery', function (request, response) {
    console.log("login delivery");
    var email = request.body.deliveryemail;
    var pass = request.body.deliverypass;
    console.log(request.body.deliveryemail);
    console.log("okkkkkkkkkk");

    let query1 = "Select * from delivery where deliveryemail=? and deliverypass=?";

    pool.query(query1, [email, pass], function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            
            response.send(results);
        }
    });
});
app.post('/loginseller', function (request, response) {
    console.log("login seller");
    var email = request.body.selleremail;
    var pass = request.body.sellerpass;
    console.log(request.body.selleremail);
    console.log("okkkkkkkkkk");

    let query1 = "Select * from sellers where selleremail=? and sellerpass=?";

    pool.query(query1, [email, pass], function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            response.send(results);
        }
    });
});




app.post('/register', function (request, response) {
    console.log("sgin");
    var username = request.body.username;
    var userpass = request.body.userpass;
    var useremail = request.body.useremail;
    var userphone = request.body.userphone;
    var userplace = request.body.userplace;
    console.log(request.body.userplace);
    console.log("okkkkkkkkkk");
    let query1 = "INSERT INTO customer (username,useremail,userpass,userphone,userplace) VALUES('" + username
        + "','" + useremail + "','" + userpass + "','" + userphone + "','" + userplace + "') ;";
    //let query1="Select * from nada where name=? and pass=?";

    pool.query(query1, [username, useremail, userpass, userphone, userplace], function (error, data, results) {
        console.log("done qurey");


        if (error) {
            response.status(400).send('Error in database operation');
        }
        else {
            response.send("Success");

        }
        //return response;
    });
});
app.post('/registerdelivery', function (request, response) {
    console.log("sgin");
    var username = request.body.deliveryname;
    var userpass = request.body.deliverypass;
    var useremail = request.body.deliveryemail;
    var userphone = request.body.deliveryphone;
    var userplace = request.body.deliveryplace;
    console.log(request.body.deliveryplace);
    console.log("okkkkkkkkkk");
    let query1 = "INSERT INTO delivery (deliveryname,deliveryemail,deliverypass,deliveryphone,deliveryplace,flag_req) VALUES('" + username
        + "','" + useremail + "','" + userpass + "','" + userphone + "','" + userplace + "','"+0+"')";
    //let query1="Select * from nada where name=? and pass=?";

    pool.query(query1, [username, useremail, userpass, userphone, userplace], function (error, data, results) {
        console.log("done qurey");

        if (error) {
            response.status(400).send('Error in database operation');
        }
        else {
            
            response.send("Success");
            

        }

    });
});

app.post('/registerseller', function (request, response) {
    console.log("sgin");
    var username = request.body.sellername;
    var userpass = request.body.sellerpass;
    var useremail = request.body.selleremail;
    var userphone = request.body.sellerphone;
    var userplace = request.body.sellerplace;
    console.log(request.body.sellerplace);
    console.log("okkkkkkkkkk");
    let query1 = "INSERT INTO sellers (sellername,selleremail,sellerpass,sellerphone,sellerplace,flag_req) VALUES('" + username
        + "','" + useremail + "','" + userpass + "','" + userphone + "','" + userplace + "','"+0+"') ";
    //let query1="Select * from nada where name=? and pass=?";

    pool.query(query1, [username, useremail, userpass, userphone, userplace], function (error, data, results) {
        console.log("done qurey");

        
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        }
        else {
            response.send("Success");

        }

    });
});
app.post('/registerproduct', function (request, response) {
    console.log("add pro");
    var name = request.body.productname;
    var count = request.body.productcount;
    var paht = request.body.productimage;
    var type = request.body.producttype;
    var newprice = request.body.newprice;
    var oldprice = request.body.oldprice;
    var nameperson = request.body.namesupermarket;
  
   
    
    console.log("okkkkkkkkkk");
    let query1 = "INSERT INTO `products` (`productname`,`productcount`,`productimage`,`producttype`,`newprice`,`oldprice`,`namesupermarket`) VALUES('" + name
        + "','" + count + "','" + paht + "','" + type + "','" + newprice + "','"+oldprice+"','"+nameperson+"')";
    //let query1="Select * from nada where name=? and pass=?";

    pool.query(query1,[name,count,paht,type,newprice,oldprice,nameperson] ,function (error, data, results) {
        console.log("done qurey");

        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
            
        }
        else {
            response.send("Success");

        }

    });
});
app.post('/userupdate', function (request, response) {
    console.log("update");
    var username = request.body.username;
    var userpass = request.body.userpass;
    var useremail = request.body.useremail;
    var userphone = request.body.userphone;
    var userplace = request.body.userplace;
    
    console.log("okkkkkkkkkk");
   
    let query1 = `UPDATE customer  SET username='${username}',useremail='${useremail}
    ',userpass='${userpass}',userphone='${userphone}',userplace='${userplace}' WHERE useremail='${useremail}'`;
    //let query1=`UPDATE sellers SET suparmarketname='${suparmarketname}' , sellercard='${card}' WHERE selleremail='${email}'`;
    pool.query(query1,[username,useremail,userpass,userphone,userplace] ,function (error, data, results) {
     
        console.log("done qurey");

        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
            
        }
        else {
           // console.log(username);
            response.send("Success");

        }

    });
});
app.post('/walletseller', function (request, response) {
    console.log("add card");
    var suparmarketname = request.body.suparmarketname;
    var card = request.body.sellercard;
    var email=request.body.selleremail;
    console.log(email);
let query1=`UPDATE sellers SET suparmarketname='${suparmarketname}' , sellercard='${card}' WHERE selleremail='${email}'`;
    
    pool.query(query1, [suparmarketname,card], function (error, data, results) {
        console.log("done qurey");

        if (error) {
            response.status(400).send('Error in database operation');
        }
        else {

            response.send("Success");

        }

    });
});
app.post('/walletdelivery', function (request, response) {
    console.log("add card");
    
    var card = request.body.deliverycard;
    var email=request.body.deliveryemail;
    console.log(email);
let query1=`UPDATE delivery SET  deliverycard='${card}' WHERE deliveryemail='${email}'`;
    
    pool.query(query1, [card], function (error, data, results) {
        console.log("done qurey");

        if (error) {
            response.status(400).send('Error in database operation');
        }
        else {
            response.send("Success");

        }

    });
});


app.get('/editprofile', function (request, response) {
    console.log("editprofile");
// var email=request.body.useremail;
// var pass =request.body.userpass;
    let query1 = `SELECT *  FROM customer where useremail='${request.query.useremail}'`;

    pool.query(query1, function (error, results) {
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        } else {
            console.log(results);
           // console.log(results);
            response.status(200).send(results);
        }
    });
});

app.listen(3000, function () {
    console.log('Express server is listening on port 3000');
});