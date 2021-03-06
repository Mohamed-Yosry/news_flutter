import 'Source.dart';
import 'SourceResponse.dart';

class NewsItem {

	late Source source;
	late Object author;
	late String title;
	late String description;
	late String url;
	late String urlToImage;
	late String publishedAt;
	late String content;

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