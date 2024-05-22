import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io' show File, FileMode, Platform, RandomAccessFile;
import 'package:file_picker/file_picker.dart';

import '../code/connection.dart';

class FileButton extends StatelessWidget {
  FileButton({
    super.key,
    required this.username,
    required this.socketId,
    required this.connection
  });

  final Connection connection;
  final String socketId;
  final String username;

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
              sendFile();
            }),
            label: Text("File", style: TextStyle(color: Colors.white, fontSize: 22),),),
      );
    }
  }

  void sendFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);
      String fileName = file.path.split('/').last;
      RandomAccessFile accessFile = file.openSync(mode: FileMode.read);
      Uint8List buffer = Uint8List(await file.length());
      await accessFile.readInto(buffer);
      await accessFile.close();
      connection.sendFile(buffer, fileName, socketId, username);
    }
  }
}