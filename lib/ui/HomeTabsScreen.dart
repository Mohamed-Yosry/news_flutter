import 'package:flutter/material.dart';
import 'package:news_flutter/model/NewsFrag.dart';
import 'package:news_flutter/model/Source.dart';
import 'package:news_flutter/ui/TabItem.dart';


class HomeTabs extends StatefulWidget {


  Model model;
  HomeTabs(this.model,{required Key key}): super(key: key);



  @override
  State<StatefulWidget> createState() {
    return  new _HomeTabsState(model);
  }

}

class _HomeTabsState extends State<HomeTabs> {

  Model model;

  _HomeTabsState(this.model);

  int selectedTab = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.model.sources.length,
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              TabBar(
                onTap: (index){
                  setState(() {
                    selectedTab =index;
                  });

                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs:widget.model.sources.map((source) => TabItem(source, widget.model.sources.indexOf(source) == selectedTab)).toList()

              ),
              Expanded(
                child:TabBarView(
                  
                  children:
                    widget.model.sources.map((e) => NewsFrag(e,model.curruntCategories,model.curruntLocale)).toList(),

                    //widget.sources.map((e) => NewsFrag(e)).toList()
                ),
              )
            ],
          ),
        )
      );
  }
}

class Model{
  List<Source> sources;
  String curruntCategories;
  String curruntLocale;
  Model(this.sources,this.curruntCategories,this.curruntLocale);

}
