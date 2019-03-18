var mysql = require('mysql');
var config = require('../dbConfig');

var connection = mysql.createConnection(config);
connection.connect();

var evento = {};

//Insertar un evento
evento.insert = function(obj,callback){
    if(connection){
        connection.query("INSERT INTO pjumper SET ?",obj,function(err,pjumpRes){
            if(err){
                console.log("Error MySql: %s",err);
                callback(err,[]);
            } else {
                callback(null,pjumpRes);
            }
        });
    } else callback(true,"No hay conexión a la BD");
};
module.exports = evento;