import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_flutter/api/ApiManager.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/ui/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:news_flutter/AppConfigProvider.dart';
import 'package:http/http.dart' as http;
import 'HomeTabsScreen.dart';
import 'package:news_flutter/ui/arguments.dart';



class HomeScreen extends StatefulWidget {
  static const String Route_Name = "Home Screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTextFieldActive = false;
  late Future<SourceResponse> newFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newFuture = getNewsSources();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    //final arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    var searchController = TextEditingController() ;
    return GestureDetector(
      onTap: () =>FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: !_isTextFieldActive ? AppBar(
          title: new Text('',/**to add Category name**/),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28),
            )
          ),
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                    alignment: provider.curruntLocale == 'ar'? Alignment.centerLeft : Alignment.centerRight,
                    child: IconButton(
                      padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                      color: Colors.white,
                      iconSize: 34,
                      icon: Icon(Icons.search),
                      onPressed: (){
                        setState(() {
                          _isTextFieldActive=true;
                        });
                      },
                    ),
                ),
              ),
            ],
          ),
        )
        : AppBar(
          automaticallyImplyLeading: false,
          actionsIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28),
              )
          ),
          actions: [
            Expanded(
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.83,
                heightFactor: 0.72,
                child: new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                  ),
                  child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      controller: searchController = TextEditingController() ,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icon(Icons.close),
                          onPressed: (){
                            setState(() {
                              _isTextFieldActive=false;
                            });
                          },
                        ),
                        suffixIcon: IconButton(
                            color: Theme.of(context).primaryColor,
                            icon: Icon(Icons.search),
                            onPressed: (){},
                        ),
                        contentPadding: EdgeInsets.only(top: 6),
                        hintText: AppLocalizations.of(context)!.search,
                        hintStyle: TextStyle(fontSize: 13, color: Color.fromRGBO(57, 165, 82, .35), fontWeight: FontWeight.bold),
                      )
                    ),
                  ),
                ),
              ),
            ]
        ),

        drawer: Drawer(
          child: AppSideMenu(),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bckImg.png"), fit: BoxFit.fill,),
          ),
          child: FutureBuilder<SourceResponse>(
            future: newFuture,
            builder: (BuildContext context, snapshot) {
              if(snapshot.hasData)
              {
                return HomeTabs(snapshot.data!.sources,"general");
              }else if(snapshot.hasError){
                print(snapshot.error);
                return Text("error");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),///to add body from API
        )
      ),
    );
  }

}
