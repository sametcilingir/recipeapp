import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../application_layer/constant/StringConstant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application_layer/handler/route_handler/constant/RouteConstant.dart';
import '../../BaseWidgets/BaseView.dart';
import '../view_model/MainViewModel.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
        onViewModelReady: (viewModel) async => viewModel.onViewModelReady(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.receipt),
              title: const Text(StringConstant.APP_NAME),
              centerTitle: false,
            ),
            body: Observer(builder: (_) {
              return SmartRefresher(
                enablePullUp: true,
                controller: viewModel.itemRefreshController,
                onRefresh: () async => await viewModel.getItems(),
                onLoading: () async => await viewModel.getItemsMore(),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: viewModel.isItemLoading
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: viewModel.items.isEmpty,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Container(
                            height: 16,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            height: 12,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  secondChild: viewModel.items.isEmpty
                      ? Center(
                          child: Text(
                            'There is no item',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        )
                      : Observer(builder: (_) {
                          return ListView.builder(
                            addAutomaticKeepAlives: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: viewModel.items.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Theme.of(context).colorScheme.primary,
                                child: Slidable(
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dragDismissible: false,
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) async {
                                          await Share.share(
                                              'Check out this recipt ${viewModel.items[index].url}}');
                                        },
                                        backgroundColor: Color(0xFF21B7CA),
                                        foregroundColor: Colors.white,
                                        icon: Icons.share,
                                        label: 'Share',
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dragDismissible: false,
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) async {
                                          await viewModel
                                              .removeFavoriteItem(viewModel.items[index]);
                                        },
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.favorite,
                                        label: 'Remove Favorite',
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      context.push(
                                        "${RouteConstant.ITEM}/${viewModel.items[index].uri?.split("#")[1]}",
                                        extra: viewModel.items[index],
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(viewModel.items[index].label!,
                                          style:
                                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                    color: Theme.of(context).colorScheme.onPrimary,
                                                  )),
                                      subtitle: Text(
                                          viewModel.items[index].ingredients!.length.toString() +
                                              ' ingredients',
                                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                color: Theme.of(context).colorScheme.onPrimary,
                                              )),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                ),
              );
            }),
          );
        });
  }
}
