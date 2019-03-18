var router = require('express').Router();
var connection  = require('express-myconnection');
var mysql = require('mysql');

/* GET mainframe. */
router.get('/', function(req, res) {
    res.render('index');
});
/* GET mainframe. */
router.get('/hola', function(req, res) {
    res.render('jumbotronError',{errMsg:'Dante culiao'});
});
module.exports = router;
