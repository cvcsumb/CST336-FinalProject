/* Require external APIs and start our application instance */
var express = require('express');
var app = express();
var request = require('request');

/* Configure our server to read public folder and ejs files */
app.use(express.static('public'));
app.set('view engine', 'ejs');

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

/* The handler for the LOCATIONS route */
app.get('/locations', function(req, res){
    res.render('locations');
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
app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
})