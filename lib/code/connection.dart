import 'dart:async';


import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class Connection {
  Connection({
    required this.username,
  });

  final String? username;
  late bool isConnect;
  List<dynamic> users = [];

  late Socket socket;

  StreamController<List<dynamic>> _usersStreamController = StreamController<
      List<dynamic>>.broadcast();

  Stream<List<dynamic>> get usersStream => _usersStreamController.stream;

  void initializeConnection() {
    socket = io(
      "https://fastdrop-server.doctorpok.io/",
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((dynamic data) {
      print("connected");
      isConnect = true;
      socket.emit("join", {
        "name": username,
        "deviceType": "Mobile",
        "privacyLevel": "1",
        "location": "null"
      });
    });

    socket.on("updateUsers", (dynamic data) {
      users = data.where((element) => element["name"] != username).toList();
      _usersStreamController.add(users);
    });

    socket.on("removeUser", (dynamic data) {
      users = users.where((element) => element["socketId"] != data).toList();
      _usersStreamController.add(users);
    });
  }

  void sendText(String text, String socketId, String username) {
    socket.emit("textUpload",
        [text, socketId, username]);
  }

  void sendUrl(String url, String socketId, String username) {
    socket.emit("urlUpload",
        [url, socketId, username]);
  }

  void dispose() {
    _usersStreamController.close();
    socket.dispose();
  }
}