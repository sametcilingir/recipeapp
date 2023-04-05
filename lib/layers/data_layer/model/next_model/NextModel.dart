class NextModel {
  NextModel({
    this.href,
    this.title,
  });

  String? href;
  String? title;

  factory NextModel.fromJson(Map<String, dynamic> json) => NextModel(
        href: json["href"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "title": title,
      };
}
