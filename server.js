const mysql = require('mysql');
const path = require('path');
const ejs = require('ejs');
const passport = require('passport');
const bodyparser = require('body-parser');
const express = require('express');
const PUBLISHABLE_KEY ="pk_test_51GsslZCLbCjfuC3EcKiGgU19kL43OVtYft4aN9poJwIZ669XCQ0wcHspYcEd7thFOoGOu0iKojTicG1D81ZQE13m00bYFEZ6JR";
const SECRET_KEY ="sk_test_51GsslZCLbCjfuC3EA8Pgphmw8m4qsxgPO5Dv7qICrTTBulvAI6GvrV7IpYtyfNi4gnDurMVkgiq1B5KCSPxOX2l000yTI0K6tf";
const stripe = require('stripe')(SECRET_KEY);
var app = express();


app.use(bodyparser.json());
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyparser.urlencoded({extended: false}));
app.use(express.urlencoded({ extended : false}));
app.use(express.static(path.join(__dirname, 'public')));



var  connection = mysql.createConnection({
    host :'localhost',
    user :'root',
    password :'',
    database :'safivol'
});
connection.connect(function(err){
    if (err) throw err;
    console.log('connected');
})

app.get("/", function(req, res){
    res.render('client')
});


app.post('/',(req, res) => { 
    let data = {nom: req.body.nom, prenom: req.body.prenom, tele: req.body.tele, email: req.body.email, pass: req.body.pass};
    let sql = "INSERT INTO client SET ?";
    connection.query(sql, data,(err, results) => {
      if(err) throw err;
      res.render('demande');
    });
});

app.get('/demande',(req, res) => {
    res.render('demande');
});

app.get('/demande/:ville',(req, res) => {
    var ville = req.params.ville
    let sql = "SELECT * FROM vol WHERE villedep=?";
    connection.query(sql, ville, (err, rows) => {
        if(err) throw err;
        res.render('vol', {
            user : rows
        });
    });
});

app.post('/demande',(req, res) => {
    res.redirect('/demande/' + req.body.villedep);
});

app.get('/vol/booking/:id',(req,res)=>{
        res.render('reservation');
});

app.post('/vol/booking/:id',(req,res)=>{
    const volid = req.params.id;
    let dat1 = {nom: req.body.nom, prenom: req.body.prenom, tele: req.body.tele, email: req.body.email, person: req.body.person, id_v: volid};
    let sql1 = "INSERT INTO reservation SET ?";
    connection.query(sql1, dat1,(err, results) => {
        if(err) throw err;
        res.redirect('/pay/' + volid);
    });
});

app.get('/pay/:id',(req,res)=>{
    const volid = req.params.id;
    let sql2 = `Select * from vol where id_v = ${volid}`;
    connection.query(sql2, (err, result) => {
        if(err){
            throw err;
        }else{
            res.render("pay",{table:result})
        }
    });
});

app.post('/pay/:id',(req,res)=>{
    const volid = req.params.id;
    let dat2 = {ncart: req.body.ncart, datcart: req.body.datcart, nacart: req.body.nacart, prix: req.body.prix, cvv: req.body.cvv, id_v: volid};
    let sql2 = "INSERT INTO payment SET ?";
    connection.query(sql2, dat2,(err, results) => {
        if(err) throw err;
        res.redirect('/demande');
    });
});






app.get('/logout', function(req, res){
    req.logout();
    res.redirect('/');
  });









app.listen(4000,()=>console.log('Express server is runing'));

