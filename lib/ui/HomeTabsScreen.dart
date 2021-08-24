import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/model/NewsFrag.dart';
import 'package:news_flutter/model/Source.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/ui/TabItem.dart';

class HomeTabs extends StatefulWidget {
  String curruntCategories;
  List<Source> sources;
  String curruntLocale;
  HomeTabs(this.sources,this.curruntCategories,this.curruntLocale);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeTabsState(this.sources,curruntCategories,curruntLocale);
  }
}

class _HomeTabsState extends State<HomeTabs> {
  List<Source> sources;
  String curruntCategories;
  String curruntLocale;
  _HomeTabsState(this.sources,this.curruntCategories,this.curruntLocale);

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
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
                    widget.sources.map((e) => NewsFrag(e,curruntCategories,curruntLocale)).toList(),
                    //widget.sources.map((e) => NewsFrag(e)).toList()
                ),
              )
            ],
          ),
        ),);
  }
}
