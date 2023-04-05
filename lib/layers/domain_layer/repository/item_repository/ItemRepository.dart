import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import '../../../data_layer/model/item_model/ItemModel.dart';
import '../../../data_layer/model/recipe_model/RecipeModel.dart';
import '../../../data_layer/service/remote/remote_database_service/api/RemoteApiDatabaseService.dart';
import '../../entity/item_entity/ItemEntity.dart';

import '../../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../../data_layer/model/recipe_list_model/RecipeListModel.dart';
import '../../../data_layer/service/local/local_database_service/LocalDatabaseService.dart';
import '../../../data_layer/service/local/local_database_service/constant/LocalDatabaseServiceConstant.dart';
import '../../exception/Exceptions.dart';
import '../../exception/enum/ExceptionsEnum.dart';
import 'base/BaseItemRepository.dart';
import 'enum/ItemRepositoryExceptionsEnum.dart';

@lazySingleton
class ItemRepository implements BaseItemRepository {
  LocalDatabaseService get _itemLocalDatabaseService =>
      locator<LocalDatabaseService>(param1: LocalDatabaseServiceConstant.ITEM_DATABASE);

  RemoteApiDatabaseService get _itemRemoteDatabaseService => locator<RemoteApiDatabaseService>();

  String _newRecipeListModelUrl = "";

  @override
  Future<Either<Exceptions, ItemEntity>> getItemFromRemoteDatabase({
    String? uri,
  }) async {
    try {
      final isItemGotFromRemoteDatabase = await _getItemFromRemoteDatabase(
        uri: uri,
      );
      if (isItemGotFromRemoteDatabase.isRight) {
        final itemModel = ItemModel(
          key: isItemGotFromRemoteDatabase.right.uri ?? '',
          image: isItemGotFromRemoteDatabase.right.image ?? '',
          label: isItemGotFromRemoteDatabase.right.label ?? '',
          url: isItemGotFromRemoteDatabase.right.url ?? '',
          ingredientLines: isItemGotFromRemoteDatabase.right.ingredientLines ?? [],
          ingredients: isItemGotFromRemoteDatabase.right.ingredients ?? [],
          uri: isItemGotFromRemoteDatabase.right.uri ?? '',
        );
        return Right(
          ItemEntity.fromModel(
            itemModel,
          ),
        );
      } else {
        return Left(isItemGotFromRemoteDatabase.left);
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getItemFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getItemFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Exceptions, RecipeModel>> _getItemFromRemoteDatabase({
    String? uri,
  }) async {
    try {
      final recipeKey = uri!.split("#").last;
      final isItemGotFromRemoteDatabase = await _itemRemoteDatabaseService.get(
        "https://api.edamam.com/api/recipes/v2/$recipeKey",
        queryParameters: {
          "type": "public",
          "app_id": dotenv.env['EDAMAM_APP_ID']!,
          "app_key": dotenv.env['EDAMAM_RECIPT_APP_KEY']!,
        },
      );
      if (isItemGotFromRemoteDatabase != null) {
        final recipeModel = RecipeModel.fromJson(isItemGotFromRemoteDatabase['recipe']);
        return Right(recipeModel);
      } else {
        return Left(
          Exceptions(
            code: ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_REMOTE_DATABASE,
            callBack: ItemRepositoryExceptionsEnum.getItemFromRemoteDatabase,
          ),
        );
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getItemFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getItemFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, List<ItemEntity>>> getItemList({
    String? recipeName,
    String? ingredients,
    List<String>? healthLabels,
  }) async {
    try {
      final isItemListGotFromRemoteDatabase = await _getRecipeListModelFromRemoteDatabase(
        recipeName: recipeName,
        ingredients: ingredients,
        healthLabels: healthLabels,
      );
      if (isItemListGotFromRemoteDatabase.isRight) {
        final itemEntityList = isItemListGotFromRemoteDatabase.right.hits!.map((e) {
          final itemModel = ItemModel(
            key: e.recipe?.uri ?? "",
            uri: e.recipe?.uri ?? "",
            label: e.recipe?.label ?? "",
            image: e.recipe?.image ?? "",
            url: e.recipe?.url ?? "",
            ingredientLines: e.recipe?.ingredientLines ?? [],
            ingredients: e.recipe?.ingredients ?? [],
          );

          return ItemEntity.fromModel(
            itemModel,
          );
        }).toList();
        return Right(itemEntityList);
      } else {
        return Left(isItemListGotFromRemoteDatabase.left);
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getItemList,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getItemList,
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Exceptions, RecipeListModel>> _getRecipeListModelFromRemoteDatabase({
    String? recipeName,
    String? ingredients,
    List<String>? healthLabels,
  }) async {
    try {
      dynamic itemFromRemoteDatabase;

      print(recipeName.toString() + " " + ingredients.toString() + " " + healthLabels.toString());

      itemFromRemoteDatabase = await _itemRemoteDatabaseService
          .get("https://api.edamam.com/api/recipes/v2", queryParameters: {
        "type": "public",
        "app_id": dotenv.env['EDAMAM_APP_ID']!,
        "app_key": dotenv.env['EDAMAM_RECIPT_APP_KEY']!,
        "from": "1",
        "to": "20",
        if (recipeName != null && ingredients != null)
          "q": recipeName + "," + ingredients
        else if (recipeName != null && ingredients == null)
          "q": recipeName
        else if (recipeName == null && ingredients != null)
          "q": ingredients
        else if (recipeName == null && ingredients == null)
          "random": true,
        if (recipeName == null && ingredients == null) "ingr": 3,
        if (healthLabels != null) "health": healthLabels,
      });

      if (itemFromRemoteDatabase != null) {
        final itemModelFromRemoteDatabase = RecipeListModel.fromJson(itemFromRemoteDatabase);
        _newRecipeListModelUrl = itemModelFromRemoteDatabase.links?.next?.href ?? "";
        return Right(itemModelFromRemoteDatabase);
      } else {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_REMOTE_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getRecipeListModelFromRemoteDatabase,
          message: "Item not found in remote database",
        ));
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getRecipeListModelFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getRecipeListModelFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, List<ItemEntity>>> getMoreItemList() async {
    try {
      final isItemListGotFromRemoteDatabase = await _getMoreRecipeListModelFromRemoteDatabase();
      if (isItemListGotFromRemoteDatabase.isRight) {
        final itemEntityList = isItemListGotFromRemoteDatabase.right.hits!.map((e) {
          final itemModel = ItemModel(
            key: e.recipe?.uri ?? "",
            uri: e.recipe?.uri ?? "",
            label: e.recipe?.label ?? "",
            image: e.recipe?.image ?? "",
            url: e.recipe?.url ?? "",
            ingredientLines: e.recipe?.ingredientLines ?? [],
            ingredients: e.recipe?.ingredients ?? [],
          );

          return ItemEntity.fromModel(
            itemModel,
          );
        }).toList();
        return Right(itemEntityList);
      } else if (isItemListGotFromRemoteDatabase.left.code ==
          ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_REMOTE_DATABASE) {
        return Right([]);
      } else {
        return Left(isItemListGotFromRemoteDatabase.left);
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getMoreItemList,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getMoreItemList,
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Exceptions, RecipeListModel>> _getMoreRecipeListModelFromRemoteDatabase() async {
    try {
      final itemListFromRemoteDatabase = await _itemRemoteDatabaseService.get(
        _newRecipeListModelUrl,
      );

      if (itemListFromRemoteDatabase != null) {
        final itemModelListFromRemoteDatabase =
            RecipeListModel.fromJson(itemListFromRemoteDatabase);
        _newRecipeListModelUrl = itemModelListFromRemoteDatabase.links?.next?.href ?? "";
        return Right(itemModelListFromRemoteDatabase);
      } else {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_REMOTE_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getMoreRecipeListModelFromRemoteDatabase,
          message: "Item not found in remote database",
        ));
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          callBack: ItemRepositoryExceptionsEnum.getMoreRecipeListModelFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getMoreRecipeListModelFromRemoteDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, List<ItemEntity>?>> getItemListInLocalDatabase() async {
    try {
      final itemListByUserCreatedAndQuery =
          await _itemLocalDatabaseService.getFirstModels()?.cast<ItemModel>();

      if (itemListByUserCreatedAndQuery != null) {
        final itemEntityList = itemListByUserCreatedAndQuery.map((e) {
          final itemModel = ItemModel(
            key: e.uri ?? "",
            uri: e.uri ?? "",
            label: e.label ?? "",
            image: e.image ?? "",
            url: e.url ?? "",
            ingredientLines: e.ingredientLines ?? [],
            ingredients: e.ingredients ?? [],
          );

          return ItemEntity.fromModel(
            itemModel,
          );
        }).toList();
        return Right(itemEntityList);
      } else if (itemListByUserCreatedAndQuery!.isEmpty) {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getItemListInLocalDatabase,
          message: "Item not found in local database",
        ));
      } else {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getItemListInLocalDatabase,
          message: "Item not found in local database",
        ));
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          message: e.toString(),
          callBack: ItemRepositoryExceptionsEnum.getItemListInLocalDatabase,
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getItemListInLocalDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, List<ItemEntity>?>> getMoreItemListInLocalDatabase({
    required int itemCount,
  }) async {
    try {
      final itemListByUserCreated = await _itemLocalDatabaseService
          .getMoreModels(
            skip: itemCount,
          )
          ?.cast<ItemModel>();

      if (itemListByUserCreated != null) {
        final itemEntityList = itemListByUserCreated.map((e) {
          final itemModel = ItemModel(
            key: e.uri ?? "",
            uri: e.uri ?? "",
            label: e.label ?? "",
            image: e.image ?? "",
            url: e.url ?? "",
            ingredientLines: e.ingredientLines ?? [],
            ingredients: e.ingredients ?? [],
          );
          return ItemEntity.fromModel(
            itemModel,
          );
        }).toList();
        return Right(itemEntityList);
      } else if (itemListByUserCreated!.isEmpty) {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.MORE_ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getMoreItemListInLocalDatabase,
          message: "Item not found in local database",
        ));
      } else {
        return Left(Exceptions(
          code: ItemRepositoryExceptionsEnum.MORE_ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
          callBack: ItemRepositoryExceptionsEnum.getMoreItemListInLocalDatabase,
          message: "Item not found in local database",
        ));
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          message: e.toString(),
          callBack: ItemRepositoryExceptionsEnum.getMoreItemListInLocalDatabase,
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.getMoreItemListInLocalDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, bool>> isItemExistInLocalDatabase({
    required String key,
  }) async {
    try {
      final itemModel = await _itemLocalDatabaseService.getModel(key: key);
      if (itemModel != null) {
        return Right(true);
      } else {
        return Right(false);
      }
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          message: e.toString(),
          callBack: ItemRepositoryExceptionsEnum.isItemExistInLocalDatabase,
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.isItemExistInLocalDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, void>> saveItemInLocalDatabase(ItemEntity itemEntity) async {
    try {
      final itemModel = ItemModel(
        key: itemEntity.uri ?? "",
        uri: itemEntity.uri ?? "",
        label: itemEntity.label ?? "",
        image: itemEntity.image ?? "",
        url: itemEntity.url ?? "",
        ingredientLines: itemEntity.ingredientLines ?? [],
        ingredients: itemEntity.ingredients ?? [],
      );
      final isItemFound = await _itemLocalDatabaseService.getModel(
        key: itemModel.key,
      );
      if (isItemFound == null) {
        await _itemLocalDatabaseService.addModel(model: itemModel);
      }
      return Right(null);
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.saveRecipeModelInLocalDatabase,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Exceptions, void>> removeItemInLocalDatabase(ItemEntity itemEntity) async {
    try {
      final itemModel = ItemModel(
        key: itemEntity.uri ?? "",
        uri: itemEntity.uri ?? "",
        label: itemEntity.label ?? "",
        image: itemEntity.image ?? "",
        url: itemEntity.url ?? "",
        ingredientLines: itemEntity.ingredientLines ?? [],
        ingredients: itemEntity.ingredients ?? [],
      );
      final isItemFound = await _itemLocalDatabaseService.getModel(
        key: itemModel.key,
      );
      if (isItemFound != null) {
        await _itemLocalDatabaseService.deleteModel(model: itemModel);
      }
      return Right(null);
    } on ExceptionsEnum catch (e) {
      return Left(
        Exceptions(
          code: e.code,
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        Exceptions(
          callBack: ItemRepositoryExceptionsEnum.removeItemInLocalDatabase,
          message: e.toString(),
        ),
      );
    }
  }
}
