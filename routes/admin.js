var router = require('express').Router();
var admin  = require('../modelo/adminModel');
/* GET mainframe. */
router.get('/', function(req, res) {
    if(req.session.isAdminLogged){
        res.render('admin/index');
    } else res.redirect('/error');
});
/* GET mainframe. */
router.get('/login', function(req, res) {
    if(!req.session.isAdminLogged){
        res.render('admin/login');
    } else res.redirect('/admin');
});
/* GET mainframe. */
router.post('/loginHandler', function(req, res) {
    if(req.body.usuario.length <= 10 && req.body.contrasena.length <= 10){
        admin.loginHandler(req.body.usuario,req.body.contrasena,function(err,rows){
            if(err){
                console.log(rows);
                res.send({err:true,errMsg:rows});
            } else {
                if(rows){
                    req.session.isAdminLogged = true;
                    res.send({err:false,valid:true,url:'/admin'});
                } else {
                    req.session.isAdminLogged = false;
                    res.send({err:false,valid:false});
                }
            }
        });
    }
});
/* GET mainframe. */
router.post('/loginHandler', function(req, res) {
    if(req.body.usuario.length <= 10 && req.body.contrasena.length <= 10){
        admin.loginHandler(req.body.usuario,req.body.contrasena,function(err,rows){
            if(err){
                console.log(rows);
                res.send({err:true,errMsg:rows});
            } else {
                if(rows){
                    req.session.isAdminLogged = true;
                    res.send({err:false,valid:true,url:'/admin'});
                } else {
                    req.session.isAdminLogged = false;
                    res.send({err:false,valid:false});
                }
            }
        });
    }
});
router.post('/getStats', function(req, res) {
    if(req.session.isAdminLogged){
        admin.getVisitasByEdad("jump",req.body.desde,req.body.hasta,function(err,rows){
            if(err){
                console.log(rows);
                res.send({err:true,errMsg:rows});
            } else {
                console.log(rows);
                if(rows){
                    res.send({err:false,rows:rows});
                } else {
                    res.send({err:false,rows:[]});
                }
            }
        });
    }
});

module.exports = router;
