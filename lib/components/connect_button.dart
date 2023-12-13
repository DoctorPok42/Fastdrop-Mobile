import 'package:flutter/material.dart';

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
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 400,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: (() {}), child: Text("File")),
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
