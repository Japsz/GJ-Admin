var mysql = require('mysql');
var config = require('../credentials/dbAdminConfig');

var connection = mysql.createConnection(config);
connection.connect();

var admin = {};
admin.loginHandler = function(username,password,callback){
  if(connection){
      connection.query("SELECT * FROM gojump.admin WHERE user = ? AND pass = ?",[username,password],function(err,rows){
          console.log(rows);
          if(err){
              callback(true,err);
          } else {
              if(rows.length){
                  callback(null,true);
              } else callback(null, false);
          }
      });
  } else callback(true,"No BD connection")
};

admin.getVisitasByEdad = function(db,desde,hasta,callback){
    if(connection){
        connection.query("SELECT  YEAR(visitas.fnac)  AS ano, COUNT(visitas.id) AS visitas,visitas.duration  " +
            "FROM (SELECT visita.*,jumper.fnac FROM " + db +".visita LEFT JOIN " + db +".jumper ON jumper.id = visita.idjumper GROUP BY visita.id) AS visitas " +
            "WHERE (visitas.fnac BETWEEN '1900-11-3' AND ?) AND (visitas.date_g BETWEEN ? AND ?)  AND visitas.status = 'ended' " +
            "GROUP BY YEAR(visitas.fnac),visitas.duration",[new Date().toLocaleDateString(),desde,hasta],function(err,rows){
            if(err){
                callback(true,err);
            } else {
                if(rows.length){
                    callback(null,rows);
                } else callback(null, []);
            }
        });
    } else callback(true,"No BD connection");
}
module.exports = admin;