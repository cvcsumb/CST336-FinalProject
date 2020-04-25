/* Require external APIs and start our application instance */
var express = require('express');
var app = express();
var mysql = require('mysql');
var bodyParser = require('body-parser');
//var request = require('request');

/* Configure our server to read public folder and ejs files */
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));
app.set('view engine', 'ejs');

/* Configure MySQL DBMS */
const connection = mysql.createConnection({
    host: 'dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
    user: 'kpyfn44vex96sekym',
    password: 'ehoi2ti8jouvd9qo',
    database: 'n8df92sdd6bxd4p4'
});
connection.connect();
/*Local SQL Testing (To Be Deleted Once Project is Done)*/
/*const connection = mysql.createConnection({
    host: 'localhost',
    user: '',
    password: '',
    database: 'scooterdb'
});
connection.connect();*/

/* The handler for the DEFAULT route */
app.get('/', function(req, res){
    res.render('login');
});

/* The handler for the CREATE ACCOUNT route */
app.get('/createaccount', function(req, res){
    res.render('createaccount');
});

/* Create a new user - Add user into DBMS */
app.post('/createaccount', function(req, res){
	//console.log(req.body);
	connection.query('SELECT COUNT(*) FROM users;', function(error, result){
		if(error) throw error;
		if(result.length) {
		    var userId = result[0]['COUNT(*)'] + 1;
		    var stmt = 'INSERT INTO users ' +
		              '(id, name, username, email, age, password) '+
		              'VALUES ' +
		              '(' + 
		               userId + ',"' +
		               req.body.fname + '","' +
		               req.body.uname + '","' +
		               req.body.email + '","' +
		               req.body.age + '","' +
		               req.body.psw + '"' +
		               ');';
		    console.log(stmt);
		    connection.query(stmt, function(error, result){
		        if(error) throw error;
		        res.redirect('/travel');
		    });
		}
   });
});

/* The handler for the PROFILE route */
app.get('/profile', function(req, res){
	/*Will need to get logined user when login stuff is set up*/
    var stmt = 'select * from users;';
	connection.query(stmt, function(error, results){
	    var profile = null;
	    if(error) throw error;
	    if (results.length) {
	        profile = results[0];
	    }
	    res.render('profile', {profile: profile});
	});
});

/* Delete a USER from Profile Page*/
app.get('/profile/:id/delete', function(req, res){
    var stmt = 'DELETE from users WHERE id='+ req.params.id + ';';
    connection.query(stmt, function(error, result){
        if(error) throw error;
        res.redirect('/');
    });
});

/* The handler for the TRAVEL route */
app.get('/travel', function(req, res){
    var stmt = 'select * from locations, pricing where locations.id = pricing.id;';
	connection.query(stmt, function(error, results){
	    var locations = null;
	    if(error) throw error;
	    if (results.length) {
	        locations = results;
	    }
	    res.render('travel', {locations: locations});
	});
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
    var stmt = 'select * from locations, pricing where locations.id = pricing.id;';
	connection.query(stmt, function(error, results){
	    var trips = null, users = null, locations = null;
	    if(error) throw error;
	    if (results.length) {
	        trips = results;
	    }
	    res.render('admin', {users: users, locations: locations, trips: trips});
	});
});

app.get('/adminusers', function(req, res){
    var stmt = 'select * from users where name = \'' 
                + req.query.fname + '\';';
	connection.query(stmt, function(error, results){
	    var users = "noresult", locations = null;
	    if(error) throw error;
	    if (results.length) {
	        users = results;
	    }
	    res.render('admin', {users: users, locations: locations});
	});
});

/* Delete a USER from Admin Page*/
app.get('/admin/:id/deleteuser', function(req, res){
    var stmt = 'DELETE from users WHERE id='+ req.params.id + ';';
    connection.query(stmt, function(error, result){
        if(error) throw error;
        res.redirect('/admin');
    });
});

app.get('/adminlocations', function(req, res){
    var stmt = 'select * from locations where name = \'' 
                + req.query.locationName + '\';';
	connection.query(stmt, function(error, results){
	    var locations = "noresult", users = null;
	    if(error) throw error;
	    if (results.length) {
	        locations = results;
	    }
	    res.render('admin', {users: users, locations: locations});
	});
});

/* Delete a location & pricing from Admin Page*/
app.get('/admin/:id/deletelocation', function(req, res){
    var stmt = 'DELETE from locations WHERE id='+ req.params.id + ';';
    connection.query(stmt, function(error, result){
        if(error) throw error;
        var stmt = 'DELETE from pricing WHERE id='+ req.params.id + ';';
	    connection.query(stmt, function(error, result){
	        if(error) throw error;
	        res.redirect('/admin');
	    });
    });
});

/* Create a new location - Add location & pricing into DBMS */
app.post('/admin/createlocation', function(req, res){
	connection.query('SELECT COUNT(*) FROM locations;', function(error, result){
		if(error) throw error;
		if(result.length) {
		    var locationId = result[0]['COUNT(*)'] + 1;
		    var stmt = 'INSERT INTO locations ' +
		              '(id, name, numOfDevices, api) '+
		              'VALUES ' +
		              '(' + 
		               locationId + ',"' +
		               req.body.locationName2 + '","' +
		               req.body.scooters + '","Sunny"' +
		               ');';
		    connection.query(stmt, function(error, result){
		    	//Create an Empty Pricing Entry for New Location
		        connection.query('SELECT COUNT(*) FROM pricing;', function(error, result){
					if(error) throw error;
					if(result.length) {
					    var priceId = result[0]['COUNT(*)'] + 1;
					    var stmt = 'INSERT INTO pricing ' +
					              '(id, price, tax, distance) '+
					              'VALUES ' +
					              '(' + 
					               priceId + ',"0","0","0"' +
					               ');';
					    connection.query(stmt, function(error, result){
							if(error) throw error;
					        res.redirect('/admin');
					    });
					}
		        });
		    });
		}
   });
});

/* The handler for undefined routes */
app.get('*', function(req, res){
   res.render('error'); 
});

/* Start the application server */
app.listen(process.env.PORT || 3306, function(){
    console.log('Server has been started');
})