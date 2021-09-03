import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/model/NewsFrag.dart';
import 'package:news_flutter/model/Source.dart';
import 'package:news_flutter/ui/TabItem.dart';

// ignore: must_be_immutable
class HomeTabs extends StatefulWidget {
  //final Function(String,String) changeCurruntCategoty;
  String curruntCategories,search;
  List<Source> sources;
  String curruntLocale;
  HomeTabs(this.sources,this.curruntCategories,this.curruntLocale,this.search){
    print("constuctor/////////////////////////////  $curruntCategories $search");
  }


  @override
  State<StatefulWidget> createState() {
    return  _HomeTabsState(Model(sources,curruntCategories,curruntLocale,this.search));
  }

}

class _HomeTabsState extends State<HomeTabs> {

  Model model;

  _HomeTabsState(this.model){
    print("curruntCategories constuctor /////////////////////////////  ${model.curruntCategories} ");
  }

  int selectedTab = 0;

  @override
  void didUpdateWidget(covariant HomeTabs oldWidget) {
    super.didUpdateWidget(oldWidget);

   /* print("oldWidget.searchTerm isxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${oldWidget.curruntCategories}");
    print("widget.searchTerm isxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${widget.curruntCategories}");

    if (oldWidget.curruntCategories == widget.curruntCategories) {

      print("oldWidget.searchTerm isxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${oldWidget.curruntCategories}");
      print("widget.searchTerm isxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${widget.curruntCategories}");

    }*/

    }

  @override
  Widget build(BuildContext context) {
    print("curruntCategories home tabs /////////////////////////////  ${model.curruntCategories} ");
    //print("search!!!!!!!!11 /////////////////////////////  ${search} ");
    return DefaultTabController(length: widget.sources.length,
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
                tabs:widget.sources.map((source) => TabItem(source, widget.sources.indexOf(source) == selectedTab)).toList()

              ),
              Expanded(
                child:TabBarView(
                  children:
                    widget.sources.map((e) => NewsFrag(e,model.curruntCategories,model.curruntLocale)).toList(),
                    //widget.sources.map((e) => NewsFrag(e)).toList()
                ),
              )
            ],
          ),
        ),);
  }
}

class Model{
  List<Source> sources;
  String curruntCategories,search;
  String curruntLocale;
  Model(this.sources,this.curruntCategories,this.curruntLocale,this.search);
}