// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientModelAdapter extends TypeAdapter<_$_IngredientModel> {
  @override
  final int typeId = 1;

  @override
  _$_IngredientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_IngredientModel(
      key: fields[0] as String,
      text: fields[1] as String?,
      quantity: fields[2] as num?,
      measure: fields[3] as String?,
      food: fields[4] as String?,
      weight: fields[5] as num?,
      foodCategory: fields[6] as String?,
      foodId: fields[7] as String?,
      image: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_IngredientModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.measure)
      ..writeByte(4)
      ..write(obj.food)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.foodCategory)
      ..writeByte(7)
      ..write(obj.foodId)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientModel _$$_IngredientModelFromJson(Map<String, dynamic> json) =>
    _$_IngredientModel(
      key: json['key'] as String,
      text: json['text'] as String?,
      quantity: json['quantity'] as num?,
      measure: json['measure'] as String?,
      food: json['food'] as String?,
      weight: json['weight'] as num?,
      foodCategory: json['foodCategory'] as String?,
      foodId: json['foodId'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_IngredientModelToJson(_$_IngredientModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'text': instance.text,
      'quantity': instance.quantity,
      'measure': instance.measure,
      'food': instance.food,
      'weight': instance.weight,
      'foodCategory': instance.foodCategory,
      'foodId': instance.foodId,
      'image': instance.image,
    };
