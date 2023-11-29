import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        print("salut");
                        ConnectButton();
                      },
                      child: Text(
                        "Se connecter",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Image(
              image: ResizeImage(AssetImage('assets/logo.ico'),
                  width: 55, height: 50),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(text: "You are known as "),
                    TextSpan(
                        text: "Logards", style: TextStyle(color: Colors.orange))
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "You can be discovered by everyone on this network",
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  ConnectButton() {
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
