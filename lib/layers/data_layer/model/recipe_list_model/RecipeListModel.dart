import '../hit_model/HitModel.dart';
import '../item_model_links_model/ItemModelLinksModel.dart';
import '../links_model/LinksModel.dart';

class RecipeListModel {
  RecipeListModel({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  num? from;
  num? to;
  num? count;
  ItemModelLinksModel? links;
  List<HitModel>? hits;

  factory RecipeListModel.fromJson(Map<String, dynamic> json) => RecipeListModel(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: json["_links"] == null ? null : ItemModelLinksModel.fromJson(json["_links"]),
        hits: json["hits"] == null
            ? []
            : List<HitModel>.from(json["hits"]!.map((x) => HitModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toJson(),
        "hits": hits == null ? [] : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}
