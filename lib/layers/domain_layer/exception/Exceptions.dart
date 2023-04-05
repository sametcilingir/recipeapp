import 'package:freezed_annotation/freezed_annotation.dart';

part 'Exceptions.freezed.dart';

@freezed
class Exceptions with _$Exceptions {
  const Exceptions._();
  const factory Exceptions({
    Enum? code,
    String? message,
    Enum? callBack,
  }) = _Exceptions;

  //print exception
  void printException() {
    print("Exception: $code");
    print("Message: $message");
    print("CallBack: $callBack");
  }
}
