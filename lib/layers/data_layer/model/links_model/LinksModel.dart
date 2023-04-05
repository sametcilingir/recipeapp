import '../next_model/NextModel.dart';

class LinksModel {
  LinksModel({
    this.self,
    this.next,
  });

  NextModel? self;
  NextModel? next;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        self: json["self"] == null ? null : NextModel.fromJson(json["self"]),
        next: json["next"] == null ? null : NextModel.fromJson(json["next"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "next": next?.toJson(),
      };
}