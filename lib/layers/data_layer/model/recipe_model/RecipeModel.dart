import 'package:recipeapp/layers/data_layer/model/digest_model/DigestModel.dart';
import 'package:recipeapp/layers/data_layer/model/images_model/ImagesModel.dart';
import 'package:recipeapp/layers/data_layer/model/ingredient_model/IngredientModel.dart';
import 'package:recipeapp/layers/data_layer/model/total_model/TotalModel.dart';

class RecipeModel {
  RecipeModel({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  String? uri;
  String? label;
  String? image;
  ImagesModel? images;
  String? source;
  String? url;
  String? shareAs;
  num? recipeYield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<IngredientModel>? ingredients;
  num? calories;
  num? totalWeight;
  num? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  Map<String, TotalModel>? totalNutrients;
  Map<String, TotalModel>? totalDaily;
  List<DigestModel>? digest;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        uri: json["uri"] == null ? null : json["uri"],
        label: json["label"] == null ? null : json["label"],
        image: json["image"] == null ? null : json["image"],
        images: json["images"] == null ? null : ImagesModel.fromJson(json["images"]),
        source: json["source"] == null ? null : json["source"],
        url: json["url"] == null ? null : json["url"],
        shareAs: json["shareAs"] == null ? null : json["shareAs"],
        recipeYield: json["yield"] == null ? null : json["yield"],
        dietLabels:
            json["dietLabels"] == null ? [] : List<String>.from(json["dietLabels"]!.map((x) => x)),
        healthLabels: json["healthLabels"] == null
            ? []
            : List<String>.from(json["healthLabels"]!.map((x) => x)),
        cautions:
            json["cautions"] == null ? [] : List<String>.from(json["cautions"]!.map((x) => x)),
        ingredientLines: json["ingredientLines"] == null
            ? []
            : List<String>.from(json["ingredientLines"]!.map((x) => x)),
        ingredients: json["ingredients"] == null
            ? []
            : List<IngredientModel>.from(json["ingredients"]!.map((x) {
                return IngredientModel(
                  key: x["foodId"] ,
                  text: x["text"],
                  quantity: x["quantity"],
                  measure: x["measure"],
                  food: x["food"],
                  weight: x["weight"],
                  foodCategory: x["foodCategory"],
                  foodId: x["foodId"],
                  image: x["image"],
                );
              })),
        calories: json["calories"],
        totalWeight: json["totalWeight"],
        totalTime: json["totalTime"],
        cuisineType: json["cuisineType"] == null
            ? []
            : List<String>.from(json["cuisineType"]!.map((x) => x)),
        mealType:
            json["mealType"] == null ? [] : List<String>.from(json["mealType"]!.map((x) => x)),
        dishType:
            json["dishType"] == null ? [] : List<String>.from(json["dishType"]!.map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"]!)
            .map((k, v) => MapEntry<String, TotalModel>(k, TotalModel.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]!)
            .map((k, v) => MapEntry<String, TotalModel>(k, TotalModel.fromJson(v))),
        digest: json["digest"] == null
            ? []
            : List<DigestModel>.from(json["digest"]!.map((x) => DigestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images?.toJson(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => x)),
        "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => x)),
        "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
        "ingredientLines":
            ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
        "ingredients":
            ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": cuisineType == null ? [] : List<dynamic>.from(cuisineType!.map((x) => x)),
        "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
        "dishType": dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => x)),
        "totalNutrients":
            Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": digest == null ? [] : List<dynamic>.from(digest!.map((x) => x.toJson())),
      };
}
