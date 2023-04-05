import 'package:flutter/material.dart';

import 'layers/application_layer/handler/initialize_handler/InitializeHandler.dart';
import 'layers/presentation_layer/0_MyApp/view/MyAppView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeHandler.setup();
  runApp(
    const MyAppView(),
  );
}
