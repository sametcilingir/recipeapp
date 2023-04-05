import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../../domain_layer/entity/item_entity/ItemEntity.dart';
import '../../../domain_layer/repository/item_repository/ItemRepository.dart';
import '../../2.1_Main/view_model/MainViewModel.dart';
import '../../BaseWidgets/BaseViewModel.dart';

part 'SearchViewModel.g.dart';

@lazySingleton
class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit SearchViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    super.onViewModelReady();
    print("onViewModelReady SearchViewModel");
    await getSearchItems();
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose SearchViewModel");
    super.onDispose();
  }

  @observable
  TextEditingController recipeNameController = TextEditingController();

  @observable
  TextEditingController ingredientsController = TextEditingController();

  @observable
  RefreshController itemRefreshController = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.idle,
    initialRefreshStatus: RefreshStatus.idle,
  );

  ItemRepository get itemRepository => locator<ItemRepository>();

  @observable
  ObservableList<ItemEntity> items = <ItemEntity>[].asObservable();

  @observable
  bool isItemLoading = false;

  @observable
  GroupButtonController groupButtonController = GroupButtonController();

  @action
  Future getSearchItems() async {
    itemRefreshController.loadComplete();
    isItemLoading = true;
    final healthLabels = groupButtonController.selectedIndexes.map((index) {
      if (index == 0) return "vegan";
      if (index == 1) return "gluten-free";
      return "";
    }).toList();
    

    final isItemGot = await itemRepository.getItemList(
      recipeName: recipeNameController.text.isNotEmpty ? recipeNameController.text : null,
      ingredients: ingredientsController.text.isNotEmpty ? ingredientsController.text : null,
      healthLabels: healthLabels.isNotEmpty ? healthLabels : null,
    );

    if (isItemGot.isRight) {
      items = isItemGot.right.asObservable();
    } else {
      isItemGot.left.printException();
    }
    itemRefreshController.refreshCompleted();
    isItemLoading = false;
  }

  @action
  Future getSearchItemsMore() async {
    itemRefreshController.loadComplete();
    final isItemGot = await itemRepository.getMoreItemList();
    if (isItemGot.isRight) {
      items.addAll(isItemGot.right);
    } else {
      isItemGot.left.printException();
    }
    itemRefreshController.refreshCompleted();
  }

  MainViewModel get mainViewModel => locator<MainViewModel>();

  @action
  Future addFavoriteItem(ItemEntity item) async {
    final isItemAdded = await itemRepository.saveItemInLocalDatabase(item);
    if (isItemAdded.isRight) {
      await mainViewModel.getItems();
      print("Item Added");
    } else {
      isItemAdded.left.printException();
    }
  }
}
