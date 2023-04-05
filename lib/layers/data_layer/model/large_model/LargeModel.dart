class LargeModel {
    LargeModel({
        this.url,
        this.width,
        this.height,
    });

    String? url;
    num? width;
    num? height;

    factory LargeModel.fromJson(Map<String, dynamic> json) => LargeModel(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}