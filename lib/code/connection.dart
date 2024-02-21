import 'dart:ffi';
import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class Connection {
  Connection({
    required this.username,
    this.isConnect,
  });
  final String username;
  bool? isConnect = false;
  late List users;
  
  Socket socket = io("https://fastdrop-server.doctorpok.io/",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
  );

  void connection(){
    socket.onConnect((data) {
      print("connected");
      isConnect = true;
      socket.emit("join", {"name": username, "deviceType": "Mobile", "privacyLevel": "1", "location": "null"});
    });
    socket.on("updateUsers", (data) {
      users = data;
    });
    socket.on("textDownload", (data) {
      print(data);
    });
    socket.on("urlDownload", (data) {
      print(data);
    });
  }
  
  void sendText(String text) {
    socket.emit("textUpload", {"text": text, "targetUser": "all", "username": username});
  }

  void sendUrl(String url) {
    socket.emit("urlUpload", {"url": url, "targetUser": "all", "username": username});
  }
  
}