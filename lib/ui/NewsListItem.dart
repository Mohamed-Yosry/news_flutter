

import 'package:flutter/material.dart';
import 'package:news_flutter/model/articles.dart';

class NewsListItem extends StatelessWidget {
  NewsItem news;

  NewsListItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
              child: Image.network(news.urlToImage,width: double.infinity,height: 240,)
          ),
          Text(news.title),
          Text(news.description,maxLines: 3,style: TextStyle(),overflow: TextOverflow.ellipsis,),
          Text(news.publishedAt),
        ],
      ),
    );
  }
}
