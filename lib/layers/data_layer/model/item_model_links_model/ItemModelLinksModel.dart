import '../next_model/NextModel.dart';

class ItemModelLinksModel {
    ItemModelLinksModel({
        this.self,
        this.next,
    });

    NextModel? self;
    NextModel? next;

    factory ItemModelLinksModel.fromJson(Map<String, dynamic> json) => ItemModelLinksModel(
        self: json["self"] == null ? null : NextModel.fromJson(json["self"]),
        next: json["next"] == null ? null : NextModel.fromJson(json["next"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "next": next?.toJson(),
    };
}