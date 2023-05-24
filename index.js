var express = require('express');
var app = express();

app.use(express.json());
const userRouter= require('./user');
app.use('/user',userRouter);

// var db=require('./db.js');
app.listen(3000,()=>console.log('Example app listening at port:3000'));
 