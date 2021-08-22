import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSideMenu extends StatelessWidget {
  List<SideMenuItemData> sideMenuList =[
    SideMenuItemData(Icons.view_list_rounded, "Categoriese"),
    SideMenuItemData(Icons.settings, "Settings"),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: [
          new Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 55),
            child: new Center(
              child: new Text('News App!',
                style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
              ),
            )
          ),
          Expanded(
              child: ListView.builder(itemBuilder: (context, index)
                  {
                    return SideMenuItem(sideMenuList[index]);
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
  SideMenuItemData(this.iconData, this.title);
}

class SideMenuItem extends StatelessWidget{
  SideMenuItemData myData;
  SideMenuItem(this.myData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(16), child: Icon(myData.iconData, size: 26,),),
        Text(myData.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
      ],
    );
  }

}

