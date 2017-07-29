var socket  = require( 'socket.io' ),
  express = require('express'),
  app  = express(),
  server = require('http').createServer(app),
  io = socket.listen(server),
  port    = process.env.PORT || 3000,
  mysql = require('mysql'),
  notifications = [],
  isInitNotes = false
  socketCount = 0,
  db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'storelte',
    port: 3306
  });

db.connect(function(err) {
  if (err) {
    console.log(err);
  }
});

server.listen(port, function () {
  console.log('Server listening at port %d', port);
});


io.on('connection', function (socket) {
   socketCount++;
   console.log(socketCount);

   socket.on('disconnect', function () {
     socketCount--;
     console.log(socketCount);
   });


   if (!isInitNotes) {
        db.query('SELECT * FROM storelte_notifications').on('result', function(notification){
              notifications.push(notification);
        }).on('end', function(){
          socket.emit('notification',notifications);
        });
        isInitNotes = true
    } else {
        socket.emit('notification',notifications);
    }

});