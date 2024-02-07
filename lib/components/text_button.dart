import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  ButtonText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ButtonText> createState() => _ButtonText();
}

class _ButtonText extends State<ButtonText> {
  late TextEditingController controller;
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(56, 182, 255, 1))),
        onPressed: () {
          openDialog();
        },
        label: Text(widget.text, style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.file_copy),
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
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter your ${widget.text}"),
            ),
            actions: [
              TextButton(
                child: Text("Submit"),
                onPressed: Navigator.of(context).pop,
              ),
            ],
          );
        });
  }
}
