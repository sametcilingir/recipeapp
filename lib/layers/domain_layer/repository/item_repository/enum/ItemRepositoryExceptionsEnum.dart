import '../../../exception/enum/ExceptionsEnum.dart';

enum ItemRepositoryExceptionsEnum implements ExceptionsEnum {
  //Methods Exceptions
  getItemFromRemoteDatabase,
  getItemList,
  getMoreItemList,
  getRecipeListModelFromRemoteDatabase,
  getMoreRecipeListModelFromRemoteDatabase,
  getItemListInLocalDatabase,
  getMoreItemListInLocalDatabase,
  isItemExistInLocalDatabase,
  saveRecipeModelInLocalDatabase,
  removeItemInLocalDatabase,
  //Other Exceptions
  ITEM_NOT_FOUND_IN_REMOTE_DATABASE,
  ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
  MORE_ITEM_NOT_FOUND_IN_LOCAL_DATABASE,
  UNKNOWN_ERROR;

  @override
  Enum get code => this;

  @override
  String get message => this.toString();
}
