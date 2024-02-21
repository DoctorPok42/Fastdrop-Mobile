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
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(56, 182, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            fixedSize: Size(175, 75),
          ),
            icon: Icon(Icons.file_upload, color: Colors.white, size: 22,),
            onPressed: (() {
              getFile();
            }),
            label: Text("File", style: TextStyle(color: Colors.white, fontSize: 22),),),
      );
    }
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }
}
