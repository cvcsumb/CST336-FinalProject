/* Require external APIs and start our application instance */
var express = require('express');
var app = express();
var mysql = require('mysql');
//var request = require('request');

/* Configure our server to read public folder and ejs files */
app.use(express.static('public'));
app.set('view engine', 'ejs');

/* Configure MySQL DBMS */
const connection = mysql.createConnection({
    host: 'dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
    user: 'kpyfn44vex96sekym', /*Add your local mysql username*/
    password: 'ehoi2ti8jouvd9qo', /*Add your local mysql password*/
    database: 'n8df92sdd6bxd4p4'
});
connection.connect();

/* The handler for the DEFAULT route */
app.get('/', function(req, res){
    res.render('login');
});

/* The handler for the CREATE ACCOUNT route */
app.get('/createaccount', function(req, res){
    res.render('createaccount');
});

/* The handler for the PROFILE route */
app.get('/profile', function(req, res){
    res.render('profile');
});

/* The handler for the TRAVEL route */
app.get('/travel', function(req, res){
    res.render('travel');
});

/* The handler for the API route */
app.get('/api', function(req, res){
    res.render('api');
});

/* The handler for the LOCATIONS route */
app.get('/locations', function(req, res){
    var locationsN, locationsNS, locationsW = null;
    res.render('locations', {locationsN: locationsN, locationsNS: locationsNS, locationsW: locationsW});
});

app.get('/locationsbyname', function(req, res){
    var stmt = 'select * from locations where name = \'' 
                + req.query.lname + '\';';
	connection.query(stmt, function(error, results){
	    var locationsN, locationsNS, locationsW = null;
	    if(error) throw error;
	    if (results.length) {
	        locationsN = results;
	    }
	    res.render('locations', {locationsN: locationsN, locationsNS: locationsNS, locationsW: locationsW});
	});
});

app.get('/locationsbynumscooters', function(req, res){
    var stmt = 'select * from locations where numOfDevices >= \'' 
                + req.query.numScooters + '\';';
	connection.query(stmt, function(error, results){
	    var locationsN, locationsNS, locationsW = null;
	    if(error) throw error;
	    if (results.length) {
	        locationsNS = results;
	    }
	    res.render('locations', {locationsN: locationsN, locationsNS: locationsNS, locationsW: locationsW});
	});
});

app.get('/locationsbyweather', function(req, res){
    var stmt = 'select * from locations where api = \'' 
                + req.query.weather + '\';';
	connection.query(stmt, function(error, results){
	    var locationsN, locationsNS, locationsW = null;
	    if(error) throw error;
	    if (results.length) {
	        locationsW = results;
	    }
	    res.render('locations', {locationsN: locationsN, locationsNS: locationsNS, locationsW: locationsW});
	});
});

/* The handler for the ADMIN route */
app.get('/admin', function(req, res){
    res.render('admin');
});

/* The handler for undefined routes */
app.get('*', function(req, res){
   res.render('error'); 
});

/* Start the application server */
app.listen(process.env.PORT || 3306, function(){
    console.log('Server has been started');
})