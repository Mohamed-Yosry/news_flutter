import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_flutter/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// ignore: must_be_immutable
class  AppBarWithSearch extends StatefulWidget {
  bool _isTextFieldActive = false, onSearch = false;
  final Function(String,String) changeCurruntCategoty;
  String windowTitle = "";
  AppBarWithSearch(this._isTextFieldActive,this.onSearch,this.windowTitle,this.changeCurruntCategoty);
  @override
  _AppBarWithSearchState createState() => _AppBarWithSearchState(_isTextFieldActive,onSearch,windowTitle,changeCurruntCategoty);
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  bool _isTextFieldActive = false, onSearch = false;
  Function(String,String) changeCurruntCategoty;
  String windowTitle = "";
  _AppBarWithSearchState(this._isTextFieldActive,this.onSearch,this.windowTitle,this.changeCurruntCategoty);
  var searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    return !_isTextFieldActive ? AppBar(
      title: new Text(windowTitle,/**to add Category name**/),
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
                    autofocus: true,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    controller: searchController,
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
                        onPressed: (){
                          changeCurruntCategoty(windowTitle,searchController.text);
                          setState(() {
                            windowTitle = AppLocalizations.of(context)!.searchAppBar;
                            _isTextFieldActive=false;
                          });
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }

                        },
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
    );
  }
}
