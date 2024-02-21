import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  ButtonText({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  State<ButtonText> createState() => _ButtonText();
}

class _ButtonText extends State<ButtonText> {
  late TextEditingController controller;
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
