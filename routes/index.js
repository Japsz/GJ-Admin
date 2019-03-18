var router = require('express').Router();
var connection  = require('express-myconnection');
var mysql = require('mysql');

/* GET mainframe. */
router.get('/', function(req, res) {
    res.render('index');
});

module.exports = router;
