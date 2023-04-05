// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ItemModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  @HiveField(0)
  String get key => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get uri => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get label => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String>? get ingredientLines => throw _privateConstructorUsedError;
  @HiveField(6)
  List<IngredientModel>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res, ItemModel>;
  @useResult
  $Res call(
      {@HiveField(0) String key,
      @HiveField(1) String? uri,
      @HiveField(2) String? label,
      @HiveField(3) String? image,
      @HiveField(4) String? url,
      @HiveField(5) List<String>? ingredientLines,
      @HiveField(6) List<IngredientModel>? ingredients});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res, $Val extends ItemModel>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? uri = freezed,
    Object? label = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? ingredientLines = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientLines: freezed == ingredientLines
          ? _value.ingredientLines
          : ingredientLines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemModelCopyWith<$Res> implements $ItemModelCopyWith<$Res> {
  factory _$$_ItemModelCopyWith(
          _$_ItemModel value, $Res Function(_$_ItemModel) then) =
      __$$_ItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String key,
      @HiveField(1) String? uri,
      @HiveField(2) String? label,
      @HiveField(3) String? image,
      @HiveField(4) String? url,
      @HiveField(5) List<String>? ingredientLines,
      @HiveField(6) List<IngredientModel>? ingredients});
}

/// @nodoc
class __$$_ItemModelCopyWithImpl<$Res>
    extends _$ItemModelCopyWithImpl<$Res, _$_ItemModel>
    implements _$$_ItemModelCopyWith<$Res> {
  __$$_ItemModelCopyWithImpl(
      _$_ItemModel _value, $Res Function(_$_ItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? uri = freezed,
    Object? label = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? ingredientLines = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$_ItemModel(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredientLines: freezed == ingredientLines
          ? _value._ingredientLines
          : ingredientLines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: "ItemModelAdapter")
class _$_ItemModel extends _ItemModel {
  _$_ItemModel(
      {@HiveField(0) required this.key,
      @HiveField(1) this.uri,
      @HiveField(2) this.label,
      @HiveField(3) this.image,
      @HiveField(4) this.url,
      @HiveField(5) final List<String>? ingredientLines,
      @HiveField(6) final List<IngredientModel>? ingredients})
      : _ingredientLines = ingredientLines,
        _ingredients = ingredients,
        super._();

  factory _$_ItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemModelFromJson(json);

  @override
  @HiveField(0)
  final String key;
  @override
  @HiveField(1)
  final String? uri;
  @override
  @HiveField(2)
  final String? label;
  @override
  @HiveField(3)
  final String? image;
  @override
  @HiveField(4)
  final String? url;
  final List<String>? _ingredientLines;
  @override
  @HiveField(5)
  List<String>? get ingredientLines {
    final value = _ingredientLines;
    if (value == null) return null;
    if (_ingredientLines is EqualUnmodifiableListView) return _ingredientLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientModel>? _ingredients;
  @override
  @HiveField(6)
  List<IngredientModel>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemModel(key: $key, uri: $uri, label: $label, image: $image, url: $url, ingredientLines: $ingredientLines, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemModel &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._ingredientLines, _ingredientLines) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      uri,
      label,
      image,
      url,
      const DeepCollectionEquality().hash(_ingredientLines),
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      __$$_ItemModelCopyWithImpl<_$_ItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemModelToJson(
      this,
    );
  }
}

abstract class _ItemModel extends ItemModel {
  factory _ItemModel(
      {@HiveField(0) required final String key,
      @HiveField(1) final String? uri,
      @HiveField(2) final String? label,
      @HiveField(3) final String? image,
      @HiveField(4) final String? url,
      @HiveField(5) final List<String>? ingredientLines,
      @HiveField(6) final List<IngredientModel>? ingredients}) = _$_ItemModel;
  _ItemModel._() : super._();

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$_ItemModel.fromJson;

  @override
  @HiveField(0)
  String get key;
  @override
  @HiveField(1)
  String? get uri;
  @override
  @HiveField(2)
  String? get label;
  @override
  @HiveField(3)
  String? get image;
  @override
  @HiveField(4)
  String? get url;
  @override
  @HiveField(5)
  List<String>? get ingredientLines;
  @override
  @HiveField(6)
  List<IngredientModel>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_ItemModelCopyWith<_$_ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
