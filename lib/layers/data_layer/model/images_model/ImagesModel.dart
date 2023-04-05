import '../large_model/LargeModel.dart';

class ImagesModel {
    ImagesModel({
        this.thumbnail,
        this.small,
        this.regular,
        this.large,
    });

    LargeModel? thumbnail;
    LargeModel? small;
    LargeModel? regular;
    LargeModel? large;

    factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        thumbnail: json["THUMBNAIL"] == null ? null : LargeModel.fromJson(json["THUMBNAIL"]),
        small: json["SMALL"] == null ? null : LargeModel.fromJson(json["SMALL"]),
        regular: json["REGULAR"] == null ? null : LargeModel.fromJson(json["REGULAR"]),
        large: json["LARGE"] == null ? null : LargeModel.fromJson(json["LARGE"]),
    );

    Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail?.toJson(),
        "SMALL": small?.toJson(),
        "REGULAR": regular?.toJson(),
        "LARGE": large?.toJson(),
    };
}