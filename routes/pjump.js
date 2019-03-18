var router = require('express').Router();
var pjumpModel = require('../modelo/pjumpModel');

/* GET mainframe. */
router.get('/', function(req, res) {
    res.render('preinscripcion');
});
/*  Insertar un prejumper. */
router.post('/insert', function(req, res) {
    pjumpModel.insert(req.body,function(err,response){
       if(err){
           res.send({err:true,errMsg:err});
       } else {
           res.send({err:false,data:response});
       }
    });
});

module.exports = router;
