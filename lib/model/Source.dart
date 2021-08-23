class Source {

  late String id;
  late String name;
  late String category;
  late String url;
  late String country;
  late String language;

  Source.fromJson(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"];
}