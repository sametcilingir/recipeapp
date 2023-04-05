import '../next_model/NextModel.dart';

class HitLinksModel {
    HitLinksModel({
        this.self,
    });

    NextModel? self;

    factory HitLinksModel.fromJson(Map<String, dynamic> json) => HitLinksModel(
        self: json["self"] == null ? null : NextModel.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
    };
}