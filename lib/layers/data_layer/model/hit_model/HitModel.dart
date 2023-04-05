import '../hit_links_model/HitLinksModel.dart';

import '../recipe_model/RecipeModel.dart';

class HitModel {
  HitModel({
    this.recipe,
    this.links,
  });

  RecipeModel? recipe;
  HitLinksModel? links;

  factory HitModel.fromJson(Map<String, dynamic> json) => HitModel(
        recipe: json["recipe"] == null ? null : RecipeModel.fromJson(json["recipe"]),
        links: json["_links"] == null ? null : HitLinksModel.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe?.toJson(),
        "_links": links?.toJson(),
      };
}
