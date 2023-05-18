
const mysql = require("mysql");
const util = require("util");
var express = require('express');
var app = express();
var bodyparser = require('body-parser');
const { log, count } = require("console");
app.use(express.json());
app.use(bodyparser.urlencoded({ extended: true }));
var TABLE = 'customer';
const pool = mysql.createConnection({

    host: 'localhost',
    user: 'root',
    password: '',
    database: 'gp01',
    dateStrings: true

});

console.log("hii");
pool.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database');
  });

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
app.post('/feedback', function (request, response) {
    console.log("feedback");
    let ts = Date.now();

let date_ob = new Date(ts);
let date = date_ob.getDate();
let month = date_ob.getMonth() + 1;
let year = date_ob.getFullYear();
let currentdate=year + "-" + month + "-" + date;
    var rate = request.body.rate;
    var email = request.body.email;
    //console.log(request.body.useremail);
    console.log("okkkkkkkkkk");

    let query1 = "INSERT INTO feedback (email,date,rate) VALUES('" + email
    + "','" + currentdate + "','" + rate + "') ";

    pool.query(query1, [email, currentdate,rate], function (error, results) {
        if (error) {
            response.status(400).send('Error in database operation');
        } else {
            response.status(200).send(results);
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
app.get('/viewpro', function (request, response) {
    console.log("view pro");
    // var place = request.body.userplace;
    // console.log(place);
    console.log("okkkkkkkkkk");
    let ts = Date.now();

let date_ob = new Date(ts);
let date = date_ob.getDate();
let month = date_ob.getMonth() + 1;
let year = date_ob.getFullYear();
let currentdate=year + "-" + month + "-" + date;


let query1=`Select * from products where exp>'${currentdate}'and productcount>0 ORDER BY date(exp) ASC `;
    pool.query(query1, function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            response.send(results);
        }
    });
});
app.get('/vieworder', function (request, response) {
    console.log("all order");
let query1='SELECT * FROM `order`';
    pool.query(query1, function (error, results) {
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        } else {
            response.send(results);
        }
    });
});
app.get('/addpro', function (request, response) {
    console.log("add pro");
    var name = request.query.productname;
    var count = request.query.productcount;
    var paht = "assets/images/"+request.query.productimage;
    var type = request.query.producttype;
    var newprice = request.query.newprice;
    var oldprice = request.query.oldprice;
    var exp = request.query.exp;
    var nameperson = request.query.namesupermarket;
    var per=request.query.per;
 var percent=newprice*count*(per);
 console.log(percent);

let query1=`Select * from sellers where suparmarketname='${request.query.namesupermarket}' `;
    pool.query(query1,function (error, results) {
        if (error) {
            console.log(error);
           response.status(400).send('Error in database operation');
        
        } 
            else {
              var namesu=results[0].selleremail;
               var card=results[0].sellercard;
               console.log(card);
                if(card>percent){
                console.log("okkkkkkkkkk");
                let query1 = `INSERT INTO products (productname,
                    productcount,
                    productimage,
                    producttype,
                    newprice,
                    oldprice,
                    namesupermarket,
                    exp,
                    percent) VALUES('${request.query.productname}',
                '${request.query.productcount}',
                '${paht}',
                '${type}',
                '${newprice}',
                '${oldprice}',
                '${nameperson}',
                '${exp}',
                '${percent}')`;
                
            
                pool.query(query1,function (error, data, results) {
                    console.log("done qurey");
            
                    if (error) {
                        console.log(error);
                        response.status(400).send('Error in database operation');
                        
                    }
                    else {
                       
                        card=card-percent;
                        let query2=`UPDATE sellers SET  sellercard='${card}' WHERE suparmarketname='${nameperson}'`;
            
            pool.query(query2, [card,nameperson], function (error, data, results) {
                console.log("done qurey");
        
                if (error) {
                    console.log(error);
                    response.status(400).send('Error');
                }
                else {
                    response.send("Success update card");
        
                }
        
            });
                        // response.send("Success");
            
                    }
            
                });
            }else{
                let msg="no badget with you";
                let person="your wallet";
                let query3=`INSERT INTO notification (msg,
                    supetmarket,
                    count,namepro) VALUES('${msg}','${namesu}','${card}','${person}')`;
            
                pool.query(query3,  function (error, data, results) {
                    console.log("done notifi");
            
                    if (error) {
                        console.log(error);
                        response.status(400).send('Error');
                    }
                    else {
                        response.send("Success update card");
            
                    }
            
                });
               // response.send("no badget with you");
            }
            }
           // console.log(results[0].sellercard);
            response.status(200);
        
   });
});
app.get('/addorder', function (request, response) {
    console.log("add order");
    let query =`Select namesuper, SUM(totalprice) as total_price,nameitem,SUM(numitem)as cc from cart where emailcust='${request.query.emailcust}' and flag=2 GROUP BY namesuper`;
    pool.query(query,function (error, results) {
        if (error) { response.status(400).send(error); }
        else if (results.length === 0) {
            response.status(404).send('No results found');
          }
        else{
            console.log(request.query.emailcust);
            let query1=`SELECT *  FROM customer where useremail='${request.query.emailcust}'`;
    pool.query(query1,[request.query.emailcust], function (error, results1) {
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        } else {
          
            // const count=results1[0].cc;
            //   console.log(count);
            const phone=results1[0].userphone;
            const place=results1[0].userplace;
            const name=results1[0].username
            for (let i = 0; i < results.length; i++) {
                const row = results[i];
            console.log(row.total_price);
                   const total=row.total_price;
                   const superm=row.namesuper;
                   const count=row.cc;
                   const r="request is done";
                   const t= total*0.05;
let query3=`INSERT INTO \`order\`  (flag,nameuser,phoneuser,locationuser,orderstatus,orderprice,namesupermarket,count,orderpercent) VALUES(0,'${name}','${phone}','${place}','${r}','${total}','${superm}','${count}','${t}')`;
pool.query(query3,function (error, results0) {
    if (error) { response.status(400).send(error); }
    else{
         response.status(200)
    }

});
           
             response.status(200)
        }
        }
    });
            
    }
    });

});
app.get('/deletefromcart', function (request, response) {
    console.log("delete cart");
       //var supermarket=request.query.suparmarketname;
       let query4=`Select * from cart where idcart='${request.query.id}' `;
pool.query(query4,function (error, results4) {
    if (error) { response.status(400).send(error); }
    else{
        const name= results4[0].nameitem;
        const super1 =results4[0].namesuper;
        const cc=Number(results4[0].numitem);
let query3=`delete from cart where idcart='${request.query.id}' `;
pool.query(query3,function (error, results7) {
    if (error) { response.status(400).send(error); }
    else{
       
        let query2=` Select * from products where productname='${name}'and namesupermarket='${super1}' `;
        pool.query(query2,function (error, results) {
        if (error) { response.status(400).send(error); }
           else{
      
            const c=Number(results[0].productcount);
            var newc=c+cc;
            console.log(newc);
            let query1=`UPDATE products SET  productcount='${newc}' where productname='${name}'and namesupermarket='${super1}' `;
pool.query(query1,function (error, results) {
    if (error) { response.status(400).send(error); }
    console.log("update done ");
   // response.send(results4).status(200); 
});
} 
        });
    }
}); 
  }

  
});
});

app.get('/book', function (request, response) {
    console.log("book cart");
       //var supermarket=request.query.suparmarketname;
let query3=`UPDATE cart SET  flag=1  WHERE idcart='${request.query.id}'`;
pool.query(query3,function (error, results0) {
    if (error) { response.status(400).send(error); }
    else{
         response.send(results0).status(200)
    }

});
});
app.get('/buy', function (request, response) {
    console.log("buy cart");
       //var supermarket=request.query.suparmarketname;
let query3=`UPDATE cart SET  flag=2  WHERE idcart='${request.query.id}'`;
pool.query(query3,function (error, results0) {
    if (error) { response.status(400).send(error); }
    else{
         response.send(results0).status(200)
    }

});
});
app.get('/addcart', function (request, response) {
    console.log("add cart");
let query3=`Select * from products where productid='${request.query.id}' `;
pool.query(query3,function (error, results0) {
    if (error) { response.status(400).send(error); }

const count=Number(results0[0].productcount);
const p=Number(results0[0].newprice);
const img=String(results0[0].productimage);
const supermarket=results0[0].namesupermarket;
console.log(img);

if(count>0 && (request.query.numitem<=count)){
 
let query1=`Select * from cart where emailcust='${request.query.emailcust}'and nameitem='${request.query.nameitem}' and namesuper='${supermarket}'`;
    pool.query(query1,function (error, results1) {
        const pp=Number(request.query.numitem)
        const total=p*pp;//price*count
        console.log(total,"total price new frome query");
        if (error) {
       
           response.status(400).send('Error in database operation');
        
        } if (results1.length === 0) {
                  let query2 = `INSERT INTO cart (emailcust,nameitem,numitem,totalprice,namesuper,image,flag) VALUES('${request.query.emailcust}','${request.query.nameitem}','${request.query.numitem}','${total}','${supermarket}','${img}',0) `;
        pool.query(query2, function (error, data, results2) {
            console.log("done qurey in");
});

        }
        else {var namem=results1[0].nameitem;
            if(request.query.nameitem ==namem ){
                console.log("update");
                const v=Number(results1[0].numitem);
                const num=Number(request.query.numitem);
                const number=v+num;
                const to=Number(results1[0].totalprice);
                console.log(to," old total price");
                // const t=Number(request.query.totalprice);
                const tt=to+total;
                console.log(tt,"totalprice after up");
            let query1 = `UPDATE cart SET  numitem='${number}', totalprice='${tt}' WHERE emailcust='${request.query.emailcust}'and nameitem='${request.query.nameitem}'`;
        
            pool.query(query1, function (error, data, results3) {
                console.log("done qurey up");
           
            
            console.log(number,"new num if update in cart");
        });
            }
           // response.status(200)
        }
        
       const vv=Number(request.query.numitem);
        const s=count-vv;
        console.log(s,"new count");
        let query4 = `UPDATE products set productcount='${s}' where productid='${request.query.id}' `;
        pool.query(query4, function (error, data, results2) {
            console.log("done qurey4444");
            response.send(results2);
});
    });
}else{
    let msg="You need an extra amount";
    let query8 = `Select * from notification where supetmarket='${supermarket}'and namepro='${request.query.nameitem}'`;
    pool.query(query8, function (error, data, results44) {
        console.log("done qurey888");
        if (error) {
       
            response.status(400).send('Error in database operation');
         
         } 
        if(results44.length !== 0){
            let query9 = `INSERT INTO notification (namepro,id,count,msg,supetmarket) VALUES('${request.query.nameitem}','${request.query.id}','${count}','${msg}','${supermarket}') `;
        pool.query(query9, function (error, data, results3) {
            console.log("done qurey858");
           
      
   });
}
response.send(null);
    });
  
    //  response.send(null);
}
});

});
       
app.get('/viewproseller', function (request, response) {
    console.log("view proseller");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from products where namesupermarket='${request.query.namesupermarket}' ORDER BY date(exp) ASC `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/vieworder1', function (request, response) {
    console.log("view suprmarkt have order");
   //var supermarket=request.query.suparmarketname;
let query1='Select namesupermarket from `order`GROUP BY namesupermarket';
    pool.query(query1,function (error, results) {
        if (error) {
            console.log(error)
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/Takesorder', function (request, response) {
    console.log("Takes order");
   //var supermarket=request.query.suparmarketname;
let query1=`update \`order\` set flag=1 , namedelivery='${request.query.delname}' where orderid='${request.query.id}'`;
    pool.query(query1,function (error, results) {
        if (error) {
            console.log(error)
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/vieworder2', function (request, response) {
    console.log("view all order to spsifc supermarket");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from \`order\` where namesupermarket='${request.query.name}' and flag=0`;
    pool.query(query1,function (error, results) {
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/viewcart', function (request, response) {
    console.log("view cart all");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from cart where emailcust='${request.query.email}' and flag=0 `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/viewcartfromorder', function (request, response) {
    console.log("view cart from order");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from customer where username='${request.query.name}'`;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            const email=results[0].useremail;
          
                console.log("view cart all");
               //var supermarket=request.query.suparmarketname;
            let query1=`Select * from cart where emailcust='${email}' and flag=2`;
                pool.query(query1,function (error, results) {
                    if (error) {
                        
                        response.status(400).send('Error in database operation');
                    } else {
                       console,log(results)
                        response.send(results);
                    }
                });
         
           // response.send(results);
        }
    });
});
app.get('/viewnotif', function (request, response) {
    console.log("view notification");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from notification where supetmarket='${request.query.super}' or namepro='${request.query.super}'`;
    pool.query(query1,function (error, results) {
        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
        } else {
            console,log(results)
            response.send(results);
        }
    });
});
app.get('/viewbook', function (request, response) {
    console.log("view cart book");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from cart where emailcust='${request.query.email}' and flag=1 `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/viewbuy', function (request, response) {
    console.log("view cart buy");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from cart where emailcust='${request.query.email}' and flag=2 `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
});
app.get('/viewbuy2', function (request, response) {
    console.log("view cart buy from oredrs");
   //var supermarket=request.query.suparmarketname;
   let query1=`Select * from customer where username='${request.query.email}' `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            const email=results[0].useremail;
           // console,log(results)
            // response.send(results);
            let query1=`Select * from cart where emailcust='${email}' and flag=2 and namesuper='${request.query.supername}' `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
           // console,log(results)
            response.send(results);
        }
    });
        }
    });

});
/////////////////////////////////////////////////////////////
app.get('/viewloca', function (request, response) {
    console.log("view ,location");
   //var supermarket=request.query.suparmarketname;
let query1=`Select * from sellers `;
    pool.query(query1,function (error, results) {
        if (error) {
            
            response.status(400).send('Error in database operation');
        } else {
            console,log(results)
            response.send(results);
        }
    });
});


// app.get("/taxi", function (request, response) {
//     let query1 = `SELECT * FROM taxiapp`;
//     pool.query(query1, function (error, results) {
//       // console.log(results);
//       if (error) {
//         response.status(400).send("Error in database operation");
//       } else {
//         console.log(results);
//         response.send(results);
  
//       }
//     });
//   });
/////////////////////////////////////////////////////////////

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
        + "','" + useremail + "','" + userpass + "','" + userphone + "','" + userplace + "') ";
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


app.post('/userupdate', function (request, response) {
    console.log("update");
    var username = request.body.username;
    var userpass = request.body.userpass;
    var useremail = request.body.useremail;
    var userphone = request.body.userphone;
    var userplace = request.body.userplace;
    
    console.log("okkkkkkkkkk");
   
    let query1 = `UPDATE customer  SET username='${username}'
    ,userpass='${userpass}',userphone='${userphone}',userplace='${userplace}' WHERE useremail='${useremail}'`;
    //let query1=`UPDATE sellers SET suparmarketname='${suparmarketname}' , sellercard='${card}' WHERE selleremail='${email}'`;
    
    pool.query(query1,[username,userpass,userphone,userplace] ,function (error, data, results) {
     
        console.log("done qurey");

        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
            
        }
        else {
           // console.log(username)~;
           // response.send("Success");
            let query = `UPDATE delivery  SET deliveryname='${username}'
            ,deliverypass='${userpass}',deliveryphone='${userphone}',deliveryplace='${userplace}' WHERE deliveryemail='${useremail}'`;
    pool.query(query,[username,userpass,userphone,userplace] ,function (error, data, results) {
     
        console.log("done qurey");

        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
            
        }
        else {
           // console.log(username)~;
           // response.send("Success");
            let query2 = `UPDATE sellers  SET sellername='${username}'
            ,sellerpass='${userpass}',sellerphone='${userphone}',sellerplace='${userplace}' WHERE selleremail='${useremail}'`;
    pool.query(query2,[username,userpass,userphone,userplace] ,function (error, data, results) {
     
        console.log("done qurey");

        if (error) {
            console.log(error);
            response.status(400).send('Error in database operation');
            
        }
        else {
           // console.log(username)~;
            response.send("Success");
          
        }

    });
        }

    });
          
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
            print(error);
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

app.post('/locationseller', function (request, response) {
    console.log("location seller");
    var email=request.body.email;
    var x= request.body.xlocation;
    var y=request.body.ylocation;
    console.log(email);
let query1=`UPDATE sellers SET xlocation='${x}' , ylocation='${y}' WHERE selleremail='${email}'`;
    
    pool.query(query1, [x,y], function (error, data, results) {
        console.log("done qurey");

        if (error) {
            response.status(400).send('Error in database operation');
        }
        else {
            response.send("Success");

        }

    });
});


// app.get('/getlocation', function(request, response){
//     console.log("getlocation");
//     let query1 = `SELECT *  FROM  sellers `;
    
//     pool.query(query1, function(error, results){
//         if ( error ){
//             response.status(400).send('Error in database operation');
//         } else {
             
//             response.send(results);
            
//         }
//     });
// });



app.post('/updatecard', function (request, response) {
    console.log("update card");
    var email=request.body.email;
    var card= request.body.card;
    
    console.log(email);
let query1=`UPDATE sellers SET sellercard='${card}'  WHERE selleremail='${email}'`;
    
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

app.get('/profileseller', function (request, response) {
    console.log("profileseler");

    let query1 = `SELECT *  FROM sellers where selleremail='${request.query.useremail}'`;

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
app.get('/profildel', function (request, response) {
    console.log("profildelivery");

    let query1 = `SELECT *  FROM delivery where deliveryemail='${request.query.useremail}'`;

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

// Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app";
// import { initializeApp } from "firebase/database";
// import { getAnalytics } from "firebase/analytics";
// // TODO: Add SDKs for Firebase products that you want to use
// // https://firebase.google.com/docs/web/setup#available-libraries

// // Your web app's Firebase configuration
// // For Firebase JS SDK v7.20.0 and later, measurementId is optional
// const firebaseConfig = {
//   apiKey: "AIzaSyCzXZnhc3GZOwa9d8PSkTTCfFe5YDpHprU",
//   authDomain: "nadatest-111bf.firebaseapp.com",
//   projectId: "nadatest-111bf",
//   storageBucket: "nadatest-111bf.appspot.com",
//   messagingSenderId: "643510721336",
//   appId: "1:643510721336:web:4a41c6d00cf4af166c7fcd",
//   measurementId: "G-3C0B12SGTE"
// };

// // Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);



