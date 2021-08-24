import 'package:flutter/material.dart';
import 'package:news_flutter/api/ApiManager.dart';
import 'package:news_flutter/ui/NewsListItem.dart';

import 'NewsResponse.dart';
import 'Source.dart';
import 'SourceResponse.dart';

class NewsFrag extends StatefulWidget {
  String curruntCategories;

  final Source source;
  NewsFrag(this.source, this.curruntCategories);

  @override
  _NewsFragState createState() => _NewsFragState(curruntCategories);
}

class _NewsFragState extends State<NewsFrag> {
  String curruntCategories;
  _NewsFragState(this.curruntCategories);
  late Future<NewsResponse> newFuture;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    newFuture = loadNews(widget.source,curruntCategories);
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Container(
        child: FutureBuilder<NewsResponse>(
          future: newFuture,
          builder: (context, snapShot){
            if(snapShot.hasData)
            {
              return ListView.builder(itemBuilder: (context, index){
                return NewsListItem(snapShot.data!.articles[index]);
              },itemCount: snapShot.data!.articles.length,
              );
            }else if(snapShot.hasError){
              print(snapShot.error);
              return Text('$snapShot');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future refresh() async {
    await Future.delayed(Duration(seconds: 1));

    newFuture=loadNews(widget.source,curruntCategories);
    setState(() {});
  }
}

