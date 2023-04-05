// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<_$_ItemModel> {
  @override
  final int typeId = 0;

  @override
  _$_ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ItemModel(
      key: fields[0] as String,
      uri: fields[1] as String?,
      label: fields[2] as String?,
      image: fields[3] as String?,
      url: fields[4] as String?,
      ingredientLines: (fields[5] as List?)?.cast<String>(),
      ingredients: (fields[6] as List?)?.cast<IngredientModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ItemModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.uri)
      ..writeByte(2)
      ..write(obj.label)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.ingredientLines)
      ..writeByte(6)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      key: json['key'] as String,
      uri: json['uri'] as String?,
      label: json['label'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
      ingredientLines: (json['ingredientLines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'uri': instance.uri,
      'label': instance.label,
      'image': instance.image,
      'url': instance.url,
      'ingredientLines': instance.ingredientLines,
      'ingredients': instance.ingredients,
    };
