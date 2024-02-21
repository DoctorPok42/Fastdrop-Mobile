
import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/device_button.dart';
import 'package:share_everything_mobile/main.dart';
import 'package:share_everything_mobile/code/connection.dart';

class ConnectButton extends StatefulWidget {
  ConnectButton({super.key, required this.username});

  final username;

  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: isPressed
            ? DeviceButton()
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(56, 182, 255, 1))),
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                  DeviceButton();
                },
                child: Text(
                  "Se connecter",
                  style: TextStyle(color: Colors.white),
                ),
              ));
  }
}
