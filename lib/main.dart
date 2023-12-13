import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_everything_mobile/components/connect_button.dart';
import 'package:share_everything_mobile/components/bottom_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Share Everything',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final current = WordPair.random();
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
              child: isPressed
                  ? ConnectButton()
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(56, 182, 255, 1))),
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                        ConnectButton();
                      },
                      child: Text(
                        "Se connecter",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
          Spacer(),
          BottomPage(
            label: "Logards",
            pathImage: "assets/logo.ico",
          ),
        ],
      ),
    );
  }
}
