import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locators_init.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> serviceLocatorsInit() async {
 try {
  await  locator.init();
} on Exception catch (e) {
  print("serviceLocatorsInit error: $e");
}
}
