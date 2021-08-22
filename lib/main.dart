import 'package:flutter/material.dart';
import 'package:news_flutter/ui/CategoriesPage.dart';
import 'package:news_flutter/ui/HomeScreen.dart';
import 'package:news_flutter/ui/SideMenuSettings.dart';

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
      routes: {
        HomeScreen.Route_Name : (context) => HomeScreen(),
        SideMenuSettings.Route_name : (context) => SideMenuSettings(),
        CategoriesPage.Route_Name : (context) => CategoriesPage(),
      },
      initialRoute: HomeScreen.Route_Name,

    );
  }
}

