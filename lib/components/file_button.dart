import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:file_picker/file_picker.dart';

class FileButton extends StatelessWidget {
  FileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Text("IOS");
    } else {
      return Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(56, 182, 255, 1)
          ),
            onPressed: (() {
              getFile();
            }),
            child: Text("File")),
      );
    }
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }
}
