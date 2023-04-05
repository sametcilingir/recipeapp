import 'init/dotenv_init.dart';
import 'init/loading_init.dart';
import 'init/local_database_init.dart';
import 'init/service_locators_init.dart';

class InitializeHandler {
  static setup() async {
    try {
      await localDatabaseInit();
      await dotEnvInit();
      loadingInit();

      await serviceLocatorsInit();
    } catch (e) {
      print("InitializeHandler error: $e");
    }
  }
}
