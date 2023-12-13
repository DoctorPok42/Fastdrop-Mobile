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
