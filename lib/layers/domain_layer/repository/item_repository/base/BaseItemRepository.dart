import 'package:either_dart/either.dart';

import '../../../entity/item_entity/ItemEntity.dart';
import '../../../exception/Exceptions.dart';

abstract class BaseItemRepository {
  Future<Either<Exceptions, ItemEntity>> getItemFromRemoteDatabase({
    String? uri,
  });
  Future<Either<Exceptions, List<ItemEntity>>> getItemList({
    String? recipeName,
    String? ingredients,
    List<String>? healthLabels,
  });
  Future<Either<Exceptions, List<ItemEntity>>> getMoreItemList();
  Future<Either<Exceptions, List<ItemEntity>?>> getItemListInLocalDatabase();
  Future<Either<Exceptions, List<ItemEntity>?>> getMoreItemListInLocalDatabase({
    required int itemCount,
  });
  Future<Either<Exceptions, bool>> isItemExistInLocalDatabase({
    required String key,
  });
  Future<Either<Exceptions, void>> saveItemInLocalDatabase(ItemEntity itemEntity);
  Future<Either<Exceptions, void>> removeItemInLocalDatabase(ItemEntity itemEntity);
}
