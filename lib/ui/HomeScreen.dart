import 'package:flutter/material.dart';
import 'package:news_flutter/api/ApiManager.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/ui/CategoryChosenItem.dart';
import 'package:news_flutter/ui/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_flutter/ui/appBar/%D9%90AppBarWithSearch.dart';
import 'CategoriesPage.dart';
import 'SideMenuSettings.dart';
import 'appBar/AppBarWithoutSearch.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const String Route_Name = "Home Screen";
  String curruntLocale;
  HomeScreen(this.curruntLocale);

  @override
  _HomeScreenState createState() => _HomeScreenState(curruntLocale);
}

class _HomeScreenState extends State<HomeScreen> {
  int curruntIndex = 2, appBarIndex = 0;
  String curruntLocale;
  _HomeScreenState(this.curruntLocale);
  bool _isTextFieldActive = false, onSearch = false;
  late Future<SourceResponse> newFuture;
  String windowTitle = "general";
  var searchController = TextEditingController();
  String category = 'general',search="";

  @override
  void initState() {
    super.initState();
    print("initstate   $category");
    newFuture = getNewsSources(category, curruntLocale);
  }

  changeCategoriItem(String categoryTitle,String categoryEnglishTitle) {
    setState(() {
      windowTitle=categoryTitle;
      category=categoryEnglishTitle;
      search=categoryEnglishTitle;
      curruntIndex=2;
      appBarIndex=0;
      print("$windowTitle   /////////////////////////////  $category   ////\n$curruntIndex////////// $appBarIndex");
    });
  }

  changeCurruntBody(int newIndex) {
    setState(() {
      curruntIndex = newIndex;
      appBarIndex=1;
      Navigator.pop(context);
    });
  }



  @override
  Widget build(BuildContext context) {

    if(category=='general')
      windowTitle = AppLocalizations.of(context)!.general;

    List bodyList = [
      SideMenuSettings(),
      CategoriesPage(changeCategoriItem),
      CategoryChosenItem(newFuture, category,search),
    ];

    List appBarsList = [
      AppBarWithSearch(_isTextFieldActive, onSearch, windowTitle,changeCategoriItem),
      AppBarWithoutSearch(),
    ];

    print("under list   $windowTitle   /////////////////////////////  $category   ////\n$curruntIndex////////// $appBarIndex");

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: appBarsList[appBarIndex],
          ),
          drawer: Drawer(
            child: AppSideMenu(changeCurruntBody),
          ),
          body: bodyList[curruntIndex]),
    );
  }
}