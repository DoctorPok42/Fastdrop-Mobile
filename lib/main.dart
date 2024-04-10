import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_everything_mobile/components/connect_button.dart';
import 'package:share_everything_mobile/components/footer.dart';
import 'package:share_everything_mobile/code/connection.dart';
import 'package:word_generator/word_generator.dart';

final username = WordGenerator().randomName();


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

  _MyHomePageState();
  @override
  Widget build(BuildContext context) {
    final Connection connection = Connection(username: username);
    connection.initializeConnection();
    final appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          ConnectButton(connection: connection),
          Spacer(),
          BottomPage(
            label: username,
            pathImage: "assets/logo.ico",
          ),
        ],
      ),
    );
  }
}
