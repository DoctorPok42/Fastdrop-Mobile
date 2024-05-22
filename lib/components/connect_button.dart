import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/device_button.dart';
import 'package:share_everything_mobile/code/connection.dart';
import 'package:share_everything_mobile/components/pop_up_message.dart';
class ConnectButton extends StatefulWidget {
  ConnectButton({Key? key, required this.connection}) : super(key: key);

  final Connection connection;

  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  late StreamSubscription<List<dynamic>> _userSubscription;
  late StreamSubscription<List<dynamic>> _textSubscription;
  late StreamSubscription<List<dynamic>> _urlSubscription;
  List<String> connectedDevices = [];
  List<String> allSocketId = [];
  List<String> allUsername = [];
  List<dynamic> message = [];
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _userSubscription = widget.connection.usersStream.listen((users) {
      setState(() {
        connectedDevices = users.map((user) => user["deviceType"] as String).toList();
        allSocketId = users.map((user) => user["socketId"] as String).toList();
        allUsername = users.map((user) => user["name"] as String).toList();
      });
    });
    _textSubscription = widget.connection.textStream.stream.listen((text) {
      setState(() {
        message = text;
      });
    });
    _urlSubscription = widget.connection.urlStream.stream.listen((url) {
      setState(() {
        message = url;
      });
    });
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (message.isNotEmpty && connectedDevices.isNotEmpty) // Vérifier si la liste message et connectedDevices ne sont pas vides
            PopUpMessage(
              message: message[0],
              buttonText: "Copy",
              sender: message[1],
              onPressed: () {
              },
            ),
          if (connectedDevices.isNotEmpty) ...[
            for (var i = 0; i < connectedDevices.length; i++)
              Container(
                margin: EdgeInsets.only(bottom: 10),
                
                child: DeviceButton(typeDevice: connectedDevices[i], socketId: allSocketId[i], username: allUsername[i], connection: widget.connection),
              )
          ] else ...[
            Text(
              "Connectez-vous pour partager",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ],
      ),
    );
  }
}
