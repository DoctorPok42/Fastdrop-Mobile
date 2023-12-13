import 'package:flutter/material.dart';

class BottomText2 extends StatelessWidget {
  BottomText2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        "You can be discovered by everyone on this network",
        style: TextStyle(color: Colors.blue, fontSize: 12),
      ),
    );
  }
}
