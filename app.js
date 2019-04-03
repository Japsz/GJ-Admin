var express = require('express');
var cors = require('cors');
var path = require('path');
var logger = require('morgan');

var cookieParser = require('cookie-parser');
var cookieSession = require('cookie-session');
var bodyParser = require('body-parser');

var app = express();

app.use(cors());
// view engine setup
app.use(logger('dev'));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
// app.set('port',process.env.PORT || '3000');
// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieSession({
    name: 'session',
    keys: ['goullamp1355']
}));
// Controladores
var index = require('./routes/index');
var pjump = require('./routes/pjump');
var admin = require('./routes/admin');

// Rutas
app.use('/', index);
app.use('/pjump', pjump);
app.use('/admin', admin);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 500;
    next(err);
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;
