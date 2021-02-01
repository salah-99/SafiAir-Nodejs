const mysql = require('mysql');
const path = require('path');
const ejs = require('ejs');
const passport = require('passport');
const bodyparser = require('body-parser');
const express = require('express');
const { getMaxListeners } = require('process');
const { ifError } = require('assert');

const nodemailer = require('nodemailer');

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
    const global = 20;
    




    // let sql4 = "SELECT nombre FROM reservation WHERE id_r = 40";
    // connection.query(sql4, (err, results) => {
    //     console.log(results)
    //     if(err) throw err;
    //     //res.redirect('/pay/' + volid);
    // });
    if (req.body.person) {
        var toatal_numl = req.body.person;
        var number= global - toatal_numl;
        let dat1 = {nom: req.body.nom, prenom: req.body.prenom, tele: req.body.tele, email: req.body.email, person: req.body.person, id_v: volid , nombre:number};
        let sql1 = "INSERT INTO reservation SET ?";
        connection.query(sql1, dat1,(err, results) => {
            if(err) throw err;
            res.redirect('/pay/' + volid);
        });
    } else {

        let alert = require('alert');  
        alert("les places limitté a 20")
    }
  
});

app.get('/pay/:id',(req,res)=>{
    const volid = req.params.id;
    console.log(volid);
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
    let volid =  req.params.id;
    console.log(volid);
    let dat2 = {ncart: req.body.ncart, datcart: req.body.datcart, nacart: req.body.nacart, prix: req.body.prix, cvv: req.body.cvv, id_v: volid};
    console.log(dat2);
    let sql2 = "INSERT INTO payment SET ?";
 
    connection.query(sql2, dat2,(err, results) => {
      //  console.log(results);
        if(err) throw err;
        res.redirect('/demande');
    });
});



app.get('/logout', function(req, res){
    req.logout();
    res.redirect('/');
  });


app.post("/", (req, res) => {

   const output = `<h2>cas urgent</h2>
  <h3>les information de patient </h3>
  <ul>
  <li>Number Of Card: : ${req.body.ncart}</li>
  <li>Expiration Date: : ${req.body.datcart}</li>
  <li>Name of the card holder: : ${req.body.nacart}</li>
  <li>Cvv : ${req.body.cvv}</li>
  <li>Prix : ${req.body.prix}</li>
  </ul>`;

let transporter = nodemailer.createTransport({
    host: "smtp.ethereal.email",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: 'elabyadsaloua@gmail.com', // generated ethereal user
      pass: 'saloua1998', // generated ethereal password
    },
    tls: {
        rejectUnauthorized:false
    }
  });

 // send mail with defined transport object
 let mailOptions = {
    from: 'elabyadsaloua@gmail.com', // sender address
    to: "salouaelabyad@gmail.com", // list of receivers
    subject: "Hello ✔", // Subject line
    text: "Hello world?", // plain text body
    html: output 
  };

 transporter.sendMail(mailOptions, (error, info) => {
     if (error) {
         return console.log(error);
     }
     console.log("Message sent: %s", info.messageId);
     console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));

     res.render('demande' , {msg: 'has been sent'} );
 });
});

app.listen(8080,()=>console.log('Express server is runing'));
  