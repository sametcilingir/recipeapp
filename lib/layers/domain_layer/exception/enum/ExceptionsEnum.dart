abstract class ExceptionsEnum implements Exception {
  Enum get code;
  String get message => this.toString();

  @override
  String toString() {
    return 'ExceptionsEnum{message: $message, code: $code}';
  }
}
