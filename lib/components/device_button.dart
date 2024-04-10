import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/file_button.dart';
import 'package:share_everything_mobile/components/button_text.dart';

import '../code/connection.dart';

class DeviceButton extends StatelessWidget {
  DeviceButton({
    super.key,
    required this.typeDevice,
    required this.socketId,
    required this.username,
    required this.connection
  });

  final Connection connection;
  final String typeDevice;
  final String socketId;
  final String username;

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          onPressed: () => {
            showModalBottomSheet(
              backgroundColor: Colors.black,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Spacer(),
                        FileButton(),
                        Spacer(),
                        ButtonText(text: "Text", icon: Icons.text_fields, username: username, socketId: socketId, connection: connection),
                        Spacer(),
                        ButtonText(text: "Link", icon: Icons.link, username: username, socketId: socketId, connection: connection),
                        Spacer(),
                      ],
                    ),
                  );
                })
          },
          backgroundColor: Color.fromRGBO(56, 182, 255, 1),
          shape: CircleBorder(),
          child: Icon(
            typeDevice == "mobile" ? Icons.phone : Icons.laptop,
            size: 35,
            color: Colors.white,
          ),
        )));
  }
}
