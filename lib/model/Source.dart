class Source {

  late String id;
  late String name;
  late String description;
  late String category;
  late String url;
  late String country;
  late String language;

  //Source({required this.id, required this.name, required this.description, required this.category, required this.url,
    //required this.country, required this.language});


  Source.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        category = map["category"],
        description = map["description"],
        url = map["url"],
        language = map["language"],
        country = map["country"];


  Source.fromJson(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"];

}