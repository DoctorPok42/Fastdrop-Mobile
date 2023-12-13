import 'package:flutter/material.dart';

class BottomIcon1 extends StatelessWidget {
  BottomIcon1({
    super.key,
    required this.pathImage,
  });

  String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Image(
        image:
            ResizeImage(AssetImage(pathImage), width: 55, height: 50),
      ),
    );
  }
}
