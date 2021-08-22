import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppSideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<SideMenuItemData> sideMenuList =[
      SideMenuItemData(Icons.view_list_rounded, AppLocalizations.of(context)!.categories,"Categories"),
      SideMenuItemData(Icons.settings, AppLocalizations.of(context)!.settings,"Settings"),

    ];
    return Container(
      child: new Column(
        children: [
          new Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 55),
            child: new Center(
              child: new Text(AppLocalizations.of(context)!.title,
                style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
              ),
            )
          ),
          Expanded(
              child: ListView.builder(itemBuilder: (context, index)
                  {
                    return SideMenuItem(sideMenuList[index],index);
                  },
                  itemCount: sideMenuList.length,
              )
          )

        ],
      ),
    );
  }
}

class SideMenuItemData
{
  IconData iconData;
  String title;
  String navigatorTitle;
  SideMenuItemData(this.iconData, this.title,this.navigatorTitle);
}

class SideMenuItem extends StatelessWidget{
  SideMenuItemData myData;
  int index;
  SideMenuItem(this.myData,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, myData.navigatorTitle);

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(16), child: Icon(myData.iconData, size: 26,),),
          Text(myData.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        ],
      ),
    );
  }

}

