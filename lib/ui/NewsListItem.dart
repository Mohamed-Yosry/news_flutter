import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_flutter/model/articles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsListItem extends StatelessWidget {
  NewsItem news;
  NewsListItem(this.news);
  @override
  Widget build(BuildContext context) {
    DateTime date = new DateFormat("yyyy-MM-ddThh:mm:ss").parse(news.publishedAt);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              _launchUrl(news.url);
            },
            child: Container(
                padding: EdgeInsets.only(bottom: 6,right: 15,left: 15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(news.urlToImage,width: double.infinity,height: 240,)
            ),
          ),
          Container(padding: EdgeInsets.only(bottom: 6,right: 15,left: 15),
            child: Text(news.author.toString(),style: TextStyle(fontSize: 10,fontFamily: 'Poppins',color: Color.fromRGBO(121, 130, 139, 1.0)),
                textAlign: TextAlign.start),
          ),

          Container(padding: EdgeInsets.only(bottom: 6,right: 15,left: 15),
            child: Text(news.title,style: TextStyle(fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Color.fromRGBO(66, 80, 92, 1.0)),
                textAlign: TextAlign.start),
          ),
          Container(padding: EdgeInsets.only(bottom: 6,right: 15,left: 15),
            child: Text(timeago.format(date), style: TextStyle(fontSize: 12,fontFamily: 'Poppins',color: Color.fromRGBO(163, 163, 163, 1.0)),
                textAlign: TextAlign.end
            ),
          ),
        ],
      ),
    );
  }
}
_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not lauch URL';
  }
}