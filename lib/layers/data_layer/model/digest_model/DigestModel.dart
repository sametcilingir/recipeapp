import '../enum_values_model/EnumValuesModel.dart';

enum UnitEnum { G, MG, UNIT_G, EMPTY, KCAL }

final unitValues = EnumValuesModel({
    "%": UnitEnum.EMPTY,
    "g": UnitEnum.G,
    "kcal": UnitEnum.KCAL,
    "mg": UnitEnum.MG,
    "µg": UnitEnum.UNIT_G
});



class DigestModel {
    DigestModel({
        this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRdi,
        this.daily,
        this.unit,
        this.sub,
    });

    String? label;
    String? tag;
    String? schemaOrgTag;
    num? total;
    bool? hasRdi;
    num? daily;
    UnitEnum? unit;
    List<DigestModel>? sub;

    factory DigestModel.fromJson(Map<String, dynamic> json) => DigestModel(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"],
        total: json["total"],
        hasRdi: json["hasRDI"],
        daily: json["daily"],
        unit: unitValues.map[json["unit"]]!,
        sub: json["sub"] == null ? [] : List<DigestModel>.from(json["sub"]!.map((x) => DigestModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag,
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub": sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
    };
}