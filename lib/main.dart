import 'package:flutter/material.dart';
import 'package:news_flutter/ui/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(57, 165, 82, 1),
      ),
      home: HomeScreen(),

    );
  }
}

