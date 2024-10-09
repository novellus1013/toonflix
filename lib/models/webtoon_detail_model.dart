class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["jenre"],
        age = json["age"];
}
