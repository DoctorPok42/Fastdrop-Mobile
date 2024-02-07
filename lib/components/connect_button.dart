import 'package:flutter/material.dart';
import 'package:share_everything_mobile/components/file_button.dart';
import 'package:share_everything_mobile/components/text_button.dart';

class ConnectButton extends StatelessWidget {
  ConnectButton({
    super.key,
  });

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
                        FileButton(),
                        Spacer(),
                        ButtonText(text: "Text"),
                        Spacer(),
                        ButtonText(text: "Link")
                      ],
                    ),
                  );
                })
          },
          backgroundColor: Color.fromRGBO(56, 182, 255, 1),
          shape: CircleBorder(),
          child: Icon(
            Icons.laptop,
            size: 35,
            color: Colors.white,
          ),
        )));
  }
}
