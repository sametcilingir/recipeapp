import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> dotEnvInit() async {
  try {
  await dotenv.load(fileName: "assets/.env");
} on Exception catch (e) {
  print("dotEnvInit error: $e");
}
}
