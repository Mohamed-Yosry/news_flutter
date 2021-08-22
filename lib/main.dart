import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_flutter/ui/CategoriesPage.dart';
import 'package:news_flutter/ui/HomeScreen.dart';
import 'package:news_flutter/ui/SideMenuSettings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale.fromSubtags(languageCode: "ar"),
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.Route_Name,

    );
  }
}

