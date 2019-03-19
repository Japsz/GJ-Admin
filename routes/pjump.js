var router = require('express').Router();
var pjumpModel = require('../modelo/pjumpModel');

/* GET mainframe. */
router.get('/', function(req, res) {
    res.render('pjump/preinscripcion');
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
/*  Modificar un prejumper. */
router.post('/update', function(req, res) {
    console.log(req.body);
    var id = req.body.id;
    delete req.body['id'];
    pjumpModel.update(id,req.body,function(err,response){
        if(err){
            res.send({err:true,errMsg:err});
        } else {
            res.send({err:false,data:response});
        }
    });
});
/*  Conseguir lo prejumpers. */
router.get('/get', function(req, res) {
    pjumpModel.get(function(err,response){
        if(err){
            res.send({err:true,errMsg:err});
        } else {
            res.render('pjump/pjump_red',{data:response},function(err,html){
                if(err){
                    res.send({err:true,errMsg:err});
                } else res.send({err:false,html:html});
            });
        }
    });
});

module.exports = router;
