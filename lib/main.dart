import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_flutter/AppConfigProvider.dart';
import 'package:news_flutter/ui/HomeScreen.dart';
import 'package:news_flutter/ui/SideMenuSettings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (buildContext)=>AppConfigProvider(),
      builder:(buildContext,widget){
      final provider = Provider.of<AppConfigProvider>(buildContext);
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Color.fromRGBO(57, 165, 82, 1),
          ),

          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale.fromSubtags(languageCode: provider.curruntLocale),
          routes: {
            HomeScreen.Route_Name : (context) => HomeScreen(provider.curruntLocale),
            SideMenuSettings.Route_name : (context) => SideMenuSettings(),
          },
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: HomeScreen.Route_Name,

        );
      }
    );
  }
}

