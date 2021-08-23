import 'Source.dart';

class NewsItem {

	late Source source;
	late Object author;
	late String title;
	late String description;
	late String url;
	late String urlToImage;
	late String publishedAt;
	late String content;
	NewsItem({required this.description,required this.url,required this.content,required this.urlToImage});

	NewsItem.fromJsonMap(Map<String, dynamic> map):
				source = Source.fromJson(map["source"]),
				author = map["author"],
				title = map["title"],
				description = map["description"],
				url = map["url"],
				urlToImage = map["urlToImage"],
				publishedAt = map["publishedAt"],
				content = map["content"];

}