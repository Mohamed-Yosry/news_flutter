import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String curruntLocale="ar";

  void changeLanguage(String language){
    if(curruntLocale==language)
      return;

    curruntLocale=language;
    notifyListeners();
  }
}