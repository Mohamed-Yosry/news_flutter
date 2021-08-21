import 'package:flutter/material.dart';
import 'package:news_flutter/ui/SideMenu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('',/**to add Category name**/),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28),
          )
        ) ,

      ),
      drawer: AppSideMenu(),
      body: Container(),  ///to add body from API
    );
  }
}
