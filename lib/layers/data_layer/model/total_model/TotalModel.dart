
import '../digest_model/DigestModel.dart';

class TotalModel {
    TotalModel({
        this.label,
        this.quantity,
        this.unit,
    });

    String? label;
    num? quantity;
    UnitEnum? unit;

    factory TotalModel.fromJson(Map<String, dynamic> json) => TotalModel(
        label: json["label"],
        quantity: json["quantity"],
        unit: unitValues.map[json["unit"]]!,
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unitValues.reverse[unit],
    };
}