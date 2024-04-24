import 'dart:ui';

import 'package:flutter/material.dart';

class PopUpMessage extends StatelessWidget {
  final String message;
  final String sender;
  final String buttonText;
  final Function() onPressed;

  PopUpMessage({
    required this.message,
    required this.sender,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Page d'arrière-plan avec flou
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.5), // Couleur de l'arrière-plan avec transparence
          ),
        ),
        // Boîte de dialogue AlertDialog
        AlertDialog(
          title: Text(sender),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ],
    );
  }
}