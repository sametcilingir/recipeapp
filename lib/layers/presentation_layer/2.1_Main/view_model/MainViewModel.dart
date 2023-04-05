import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../domain_layer/entity/item_entity/ItemEntity.dart';

import '../../../application_layer/handler/initialize_handler/init/service_locators_init.dart';
import '../../../domain_layer/repository/item_repository/ItemRepository.dart';
import '../../BaseWidgets/BaseViewModel.dart';

part 'MainViewModel.g.dart';

@lazySingleton
class MainViewModel extends _MainViewModelBase with _$MainViewModel {}

abstract class _MainViewModelBase extends BaseViewModel with Store {
  @override
  @action
  Future<void> onInit() async {
    super.onInit();
    print("onInit MainViewModel");
  }

  @override
  @action
  Future<void> onViewModelReady() async {
    super.onViewModelReady();
    print("onViewModelReady MainViewModel");
    await getItems();
  }

  @override
  @disposeMethod
  @action
  Future<void> onDispose() async {
    print("onDispose MainViewModel");
    super.onDispose();
  }

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

  @action
  Future<void> getItems() async {
    itemRefreshController.loadComplete();
    isItemLoading = true;
    final isItemGot = await itemRepository.getItemListInLocalDatabase();
    if (isItemGot.isRight) {
      items.clear();
      items.addAll(isItemGot.right!);
    } else {
      isItemGot.left.printException();
    }
    itemRefreshController.refreshCompleted();
    isItemLoading = false;
  }

  @action
  Future<void> getItemsMore() async {
    if (items.isNotEmpty) {
      itemRefreshController.loadComplete();
      final isItemGot = await itemRepository.getMoreItemListInLocalDatabase(
        itemCount: items.length,
      );
      if (isItemGot.isRight) {
        items.addAll(isItemGot.right!);
      } else {
        print("${isItemGot.left.code} ${isItemGot.left.message}");
      }
      itemRefreshController.refreshCompleted();
    }
  }

  @action
  Future removeFavoriteItem(ItemEntity item) async {
    final isItemRemoved = await itemRepository.removeItemInLocalDatabase(item);
    if (isItemRemoved.isRight) {
      items.remove(item);
    } else {
      isItemRemoved.left.printException();
    }
  }
}
