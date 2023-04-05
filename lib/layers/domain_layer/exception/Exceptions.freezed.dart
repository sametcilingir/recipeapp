// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Exceptions {
  Enum? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Enum? get callBack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExceptionsCopyWith<Exceptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionsCopyWith<$Res> {
  factory $ExceptionsCopyWith(
          Exceptions value, $Res Function(Exceptions) then) =
      _$ExceptionsCopyWithImpl<$Res, Exceptions>;
  @useResult
  $Res call({Enum? code, String? message, Enum? callBack});
}

/// @nodoc
class _$ExceptionsCopyWithImpl<$Res, $Val extends Exceptions>
    implements $ExceptionsCopyWith<$Res> {
  _$ExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? callBack = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Enum?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      callBack: freezed == callBack
          ? _value.callBack
          : callBack // ignore: cast_nullable_to_non_nullable
              as Enum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExceptionsCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$_ExceptionsCopyWith(
          _$_Exceptions value, $Res Function(_$_Exceptions) then) =
      __$$_ExceptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Enum? code, String? message, Enum? callBack});
}

/// @nodoc
class __$$_ExceptionsCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$_Exceptions>
    implements _$$_ExceptionsCopyWith<$Res> {
  __$$_ExceptionsCopyWithImpl(
      _$_Exceptions _value, $Res Function(_$_Exceptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? callBack = freezed,
  }) {
    return _then(_$_Exceptions(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Enum?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      callBack: freezed == callBack
          ? _value.callBack
          : callBack // ignore: cast_nullable_to_non_nullable
              as Enum?,
    ));
  }
}

/// @nodoc

class _$_Exceptions extends _Exceptions {
  const _$_Exceptions({this.code, this.message, this.callBack}) : super._();

  @override
  final Enum? code;
  @override
  final String? message;
  @override
  final Enum? callBack;

  @override
  String toString() {
    return 'Exceptions(code: $code, message: $message, callBack: $callBack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exceptions &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.callBack, callBack) ||
                other.callBack == callBack));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, callBack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExceptionsCopyWith<_$_Exceptions> get copyWith =>
      __$$_ExceptionsCopyWithImpl<_$_Exceptions>(this, _$identity);
}

abstract class _Exceptions extends Exceptions {
  const factory _Exceptions(
      {final Enum? code,
      final String? message,
      final Enum? callBack}) = _$_Exceptions;
  const _Exceptions._() : super._();

  @override
  Enum? get code;
  @override
  String? get message;
  @override
  Enum? get callBack;
  @override
  @JsonKey(ignore: true)
  _$$_ExceptionsCopyWith<_$_Exceptions> get copyWith =>
      throw _privateConstructorUsedError;
}
