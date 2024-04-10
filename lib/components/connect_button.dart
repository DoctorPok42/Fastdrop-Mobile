import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/device_button.dart';
import 'package:share_everything_mobile/code/connection.dart';

class ConnectButton extends StatefulWidget {
  ConnectButton({Key? key, required this.connection}) : super(key: key);

  final Connection connection;

  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  late StreamSubscription<List<dynamic>> _userSubscription;
  List<String> connectedDevices = [];
  List<String> allSocketId = [];
  List<String> allUsername = [];
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
          if (isPressed) ...[
            for (var i = 0; i < connectedDevices.length; i++)
              DeviceButton(typeDevice: connectedDevices[i], socketId: allSocketId[i], username: allUsername[i], connection: widget.connection),
          ] else ...[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(56, 182, 255, 1)),
              ),
              onPressed: () {
                setState(() {
                  isPressed = true;
                });
              },
              child: Text(
                "Se connecter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
