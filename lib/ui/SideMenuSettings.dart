import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/ui/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:news_flutter/AppConfigProvider.dart';


class SideMenuSettings extends StatefulWidget {
  static const String Route_name = 'Settings';
  @override
  _SideMenuSettingsState createState() => _SideMenuSettingsState();
}

class _SideMenuSettingsState extends State<SideMenuSettings> {


  /*change(){
    setState(() {

    });
  }*/

  static final List<String> dropDownListItem =['English', 'عربي'];
  String dropListValue = 'English';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    dropListValue = provider.curruntLocale=='ar' ? dropDownListItem[1] : dropDownListItem[0];
    return Scaffold(
      appBar: AppBar(
        title: new Text(AppLocalizations.of(context)!.settings, style: TextStyle(color: Colors.white, fontSize: 22),),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28),
            )
        ),
      ),
      drawer: Drawer(
        child: AppSideMenu(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bckImg.png"), fit: BoxFit.fill,),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              margin: EdgeInsets.fromLTRB(29, 42, 29, 0),
              child: new Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
            child: new Container(
                margin: EdgeInsets.symmetric(vertical: 22, horizontal: 46),
                padding: EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  color: Colors.white
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor),
                    value: dropListValue,
                    items: dropDownListItem.map(buildMenuItem).toList(),
                    onChanged: (value){
                      setState(() {
                        print("$value");
                      if(value == 'English')
                        provider.changeLanguage('en');
                      else if(value == 'عربي')
                        provider.changeLanguage('ar');

                        dropListValue = value!;
                      });

                    },
                  ),
                ),
              ),

          ),
        ]
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>DropdownMenuItem(

    value: item,
    child: new Text(
      item,
      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
    ),
    //onTap: change ,
  );
}
