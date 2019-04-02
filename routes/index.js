var router = require('express').Router();
var connection  = require('express-myconnection');
var mysql = require('mysql');

/* GET mainframe. */
router.get('/', function(req, res) {
    res.redirect('/admin/login');
});
/* GET mainframe. */
module.exports = router;
