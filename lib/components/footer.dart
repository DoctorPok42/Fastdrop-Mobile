import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/icon.dart';
import 'package:share_everything_mobile/components/bottom_text1.dart';
import 'package:share_everything_mobile/components/bottom_text2.dart';

class BottomPage extends StatelessWidget {
  BottomPage({
    super.key,
    required this.label,
    required this.pathImage,
  });

  String label;
  String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        BottomIcon1(pathImage: pathImage),
        BottomText1(label: label),
        BottomText2(),
      ],
    ));
  }
}
