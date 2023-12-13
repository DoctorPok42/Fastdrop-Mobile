import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  ButtonText({
    super.key,
  });

  @override
  State<ButtonText> createState() => _ButtonText();
}

class _ButtonText extends State<ButtonText> {
  late TextEditingController controller;
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Text"),
        onPressed: () {
          openDialog();
        },
      ),
    );
  }

  openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Text"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter your text"),
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
