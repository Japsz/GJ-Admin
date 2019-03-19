var mysql = require('mysql');
var config = require('../dbConfig');

var connection = mysql.createConnection(config);
connection.connect();

var evento = {};

//Insertar un prejumper
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
//Conseguir los prejumpers
evento.get = function(callback){
    if(connection){
        connection.query("SELECT * FROM pjumper",function(err,pjumpRes){
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