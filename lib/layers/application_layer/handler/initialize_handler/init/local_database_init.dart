import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../data_layer/model/ingredient_model/IngredientModel.dart';
import '../../../../data_layer/model/item_model/ItemModel.dart';

import '../../../constant/StringConstant.dart';

Future<void> localDatabaseInit() async {
  try {
    await Hive.initFlutter();
    const secureStorage = FlutterSecureStorage();
    final encryptionKeyFromSecureStorage = await secureStorage.read(key: 'key');
    if (encryptionKeyFromSecureStorage == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'key',
        value: base64UrlEncode(key),
      );
    }

    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);

    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(IngredientModelAdapter());

    await Hive.openBox<HiveObject>(
      StringConstant.ITEM_DATABASE,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );

    await Hive.openBox<HiveObject>(
      StringConstant.INGREDIENT_DATABASE,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );

  } on Exception catch (e) {
    print("localDatabaseInit error: $e");
  }
}
