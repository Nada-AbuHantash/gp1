const { json, Router } = require('express');
var express = require('express');
var router = express.Router();

var dbb = require('./db.js');
console.log('user');
router.post('/regstr',(req, res) =>{

    var name=req.body.name;
    var pass=req.body.pass;
    var abc=req.body.abc;
    var id=req.body.id;
    var sqlqiury="INSERT INTO nada (name,pass,abc,id) VALUES ('"+name+"','"+pass+"','"+abc+"','"+id+"')";
    //console.log(dbb);
   
    dbb.query(sqlqiury,function(error,data,fileds){
if(error){
    res.send(JSON.stringify({success:false,massge:error}));
}
    else{
    res.send(JSON.stringify({success:true,massge:'yes regester'}));
    console.log("yes regster");
}

    });
});
module.exports=router;