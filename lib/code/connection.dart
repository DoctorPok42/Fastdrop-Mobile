import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';


void connection(){
  Socket socket = io("https://fastdrop-server.doctorpok.io/",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
  );
  socket.onConnect((data) {
    print("connected");
    socket.emit("join", {"name": "Logards", "deviceType": "Mobile", "privacyLevel": "1", "location": "null"});
  });
  socket.on("updateUsers", (data) {
    print(data);
  });
  socket.on("textDownload", (data) {
    print(data);
  });
  socket.on("urlDownload", (data) {
    print(data);
  });
}