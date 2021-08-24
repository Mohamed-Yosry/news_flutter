import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/model/NewsResponse.dart';
import 'package:news_flutter/model/Source.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:provider/provider.dart';


Future<SourceResponse> getNewsSources() async{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=47a5a3cdc1d842f2af19ab7f6b4fdaf3
  final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
      {'apiKey': '47a5a3cdc1d842f2af19ab7f6b4fdaf3'});
  final response = await http.get(uri);
  if(response.statusCode == 200)
  {
    return SourceResponse.fromJsonMap(jsonDecode(response.body));
  }else{
    throw Exception(response.body);
  }

}


Future<NewsResponse> loadNews(Source source,String category) async {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=47a5a3cdc1d842f2af19ab7f6b4fdaf3
  final uri = Uri.https("newsapi.org", "/v2/everything",
      {'apiKey':'47a5a3cdc1d842f2af19ab7f6b4fdaf3',
        'sources':source.id,
        'q': category
        //'language':provider.curruntLocale
      });

  final response = await http.get(uri);

  if(response.statusCode == 200)
  {
    print(response.statusCode);
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  else
  {
    throw Exception("error");
  }
}