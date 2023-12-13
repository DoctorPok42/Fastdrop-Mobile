import 'package:flutter/material.dart';

class BottomText1 extends StatelessWidget {
  BottomText1({
    super.key,
    required this.label,
  });

  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.grey, fontSize: 12),
            children: <TextSpan>[
              TextSpan(text: "You are known as "),
              TextSpan(text: label, style: TextStyle(color: Colors.orange))
            ]),
      ),
    );
  }
}
