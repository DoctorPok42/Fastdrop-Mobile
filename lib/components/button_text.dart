import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_everything_mobile/code/connection.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ButtonText extends StatefulWidget {
  ButtonText({
    super.key,
    required this.text,
    required this.icon,
    required this.username,
    required this.socketId,
    required this.connection
  });

  final Connection connection;
  final String socketId;
  final String username;
  final String text;
  final IconData icon;

  @override
  State<ButtonText> createState() => _ButtonText();
}

class _ButtonText extends State<ButtonText> {

  final myController = TextEditingController();

  late TextEditingController controller;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0))
          ),
          fixedSize: MaterialStateProperty.all(Size(175, 75)),
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(56, 182, 255, 1))),
        onPressed: () {
          openDialog();
        },
        label: Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 22)),
        icon: Icon(widget.icon, color: Colors.white, size: 22,),
      ),
    );
  }

  openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.text),
            content: TextField(
              controller: myController,
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter your ${widget.text}"),
            ),
            actions: [
              TextButton(
                child: Text("Submit"),
                onPressed: () {
                  if (widget.text == "Link") {
                    widget.connection.sendUrl(
                        myController.text,
                        widget.socketId,
                        widget.username
                    );
                  } else {
                    widget.connection.sendText(
                        myController.text,
                        widget.socketId,
                        widget.username
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
