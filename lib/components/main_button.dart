
import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/connect_button.dart';

class MainButton extends StatefulWidget {
  MainButton({super.key});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: isPressed
            ? ConnectButton()
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(56, 182, 255, 1))),
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                  ConnectButton();
                },
                child: Text(
                  "Se connecter",
                  style: TextStyle(color: Colors.white),
                ),
              ));
  }
}
