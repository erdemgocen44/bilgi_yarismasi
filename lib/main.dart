import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'quizPage.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: new StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  State createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new QuizPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage('assets/arkaplan.jpg'),
                    fit: BoxFit.fill)),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    new Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Container(
                      width: 500.0,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "Hadi Başlayalım",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
