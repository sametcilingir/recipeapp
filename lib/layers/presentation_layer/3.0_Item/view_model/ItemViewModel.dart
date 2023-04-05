import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../../domain_layer/entity/item_entity/ItemEntity.dart';

import '../../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../../application_layer/handler/load_handler/enum/ViewStateEnum.dart';
import '../../../domain_layer/exception/Exceptions.dart';
import '../../../domain_layer/repository/item_repository/ItemRepository.dart';
import '../../2.1_Main/view_model/MainViewModel.dart';
import '../../BaseWidgets/BaseViewModel.dart';

part 'ItemViewModel.g.dart';

@lazySingleton
class ItemViewModel = _ItemViewModelBase with _$ItemViewModel;

abstract class _ItemViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit ItemViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    super.onViewModelReady();
    print("onViewModelReady ItemViewModel");
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose ItemViewModel");
    super.onDispose();
  }

  ItemRepository get itemRepository => locator<ItemRepository>();

  @observable
  Object? params;

  @observable
  Object? extra;

  @observable
  ItemEntity? item;

  @action
  setParamsORExtra(Object? params, Object? extra) {
    this.params = params;
    this.extra = extra;

    item = extra as ItemEntity;
  }

  MainViewModel get mainViewModel => locator<MainViewModel>();

  @observable
  String? itemImage;

  @action
  Future getItem() async {
    loadHandler.changeViewState(ViewStateEnum.BUSY);

    final itemFromApi = await itemRepository.getItemFromRemoteDatabase(uri: item!.uri!);
    if (itemFromApi.isRight) {
      //item = itemFromApi.right;
      itemImage = itemFromApi.right.image!;
    } else {
      itemFromApi.left.printException();
    }
    loadHandler.changeViewState(ViewStateEnum.IDLE);
  }

  @action
  Future addFavoriteItem() async {
    final isItemAdded = await itemRepository.saveItemInLocalDatabase(item!);
    if (isItemAdded.isRight) {
      await mainViewModel.getItems();
      isItemFavorite = true;
    } else {
      isItemAdded.left.printException();
    }
  }

  @action
  Future removeFavoriteItem() async {
    final isItemRemoved = await itemRepository.removeItemInLocalDatabase(item!);
    if (isItemRemoved.isRight) {
      await mainViewModel.getItems();
      isItemFavorite = false;
    } else {
      isItemRemoved.left.printException();
    }
  }

  @observable
  bool isItemFavorite = false;

  @action
  Future checkItemFavorite() async {
    final isItemFavorite = await itemRepository.isItemExistInLocalDatabase(key: item!.key!);
    if (isItemFavorite.isRight) {
      this.isItemFavorite = isItemFavorite.right;
    } else {
      isItemFavorite.left.printException();
    }
  }
}
