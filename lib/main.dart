import 'package:challenge_appconf/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[300],
        fontFamily: 'Ubuntu',
        textTheme: TextTheme(
          title: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 24.0, height: 1.5),
          body2: TextStyle(fontSize: 24.0),
          subtitle: TextStyle(fontSize: 16.0),
        ),
      ),
      home: HomePage(),
    );
  }
}
