import 'package:flutter/material.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:provider/provider.dart';


import '../AppConfigProvider.dart';
import 'HomeTabsScreen.dart';

// ignore: must_be_immutable
class CategoryChosenItem extends StatelessWidget {
  String curruntCategory;
  late Future<SourceResponse> newFuture;
  CategoryChosenItem(this.newFuture,this.curruntCategory);


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bckImg.png"), fit: BoxFit.fill,),
      ),
      child: FutureBuilder<SourceResponse>(
        future: newFuture,
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData)
          {
            return HomeTabs(Model(snapshot.data!.sources,curruntCategory,provider.curruntLocale),key: UniqueKey());
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text("error");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),///to add body from API
    );
  }
}
