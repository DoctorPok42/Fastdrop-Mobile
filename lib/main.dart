import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MyHomePage extends StatelessWidget {
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
              child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(56, 182, 255, 1))),
            onPressed: () {
              print("Se connecte");
            },
            child: Text(
              "Se connecter",
              style: TextStyle(color: Colors.white),
            ),
          )),
          Spacer(),
          Image(
            image: AssetImage('assets/logo.ico'),
          ),
          Text(
            "You are known as Logards",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "You can be discovered by everyone on this network",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
