const mysql = require('mysql');
const path = require('path');
const ejs = require('ejs');
const bodyparser = require('body-parser');
const express = require('express');
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


app.post('/demande',(req, res) => { 
    let data = {nom: req.body.nom, prenom: req.body.prenom, tele: req.body.tele, email: req.body.email, pass: req.body.pass};
    let sql = "INSERT INTO client SET ?";
    let query = connection.query(sql, data,(err, results) => {
      if(err) throw err;
      res.render('demande');
    });
});

app.get('/demande',(req, res) => {
    res.render('demande');
});

app.get('/demande/vol',(req, res) => {
    let sql = "SELECT *FROM vol";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('vol', {
            user : rows
        });
    });
});

app.get('/vol/booking/:id',(req,res)=>{
        res.render('reservation');
});

app.post('/vol/booking/:id',(req,res)=>{
    const id = req.params.id;
    let dat = {nom: req.body.nom, prenom: req.body.prenom, tele: req.body.tele, email: req.body.email, person: req.body.person};
    let sql = "INSERT INTO reservation INNER JOIN vol ON reservation.id_v = vol.id_v AND reservation.id_v = '" +id+ "' ";
    let query = connection.query(sql, dat,(err, results) => {
        if(err) throw err;
        res.render('vol');
    });
})








app.listen(4000,()=>console.log('Express server is runing'));

