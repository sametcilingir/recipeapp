import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../../BaseWidgets/BaseView.dart';
import '../view_model/ItemViewModel.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    this.params,
    this.extra,
  });

  final Object? params;
  final Object? extra;

  @override
  Widget build(BuildContext context) {
    return BaseView<ItemViewModel>(
      onViewModelReady: (viewModel) async {
        await viewModel.onViewModelReady();
        //
        viewModel.setParamsORExtra(params, extra);
        await viewModel.checkItemFavorite();
        await viewModel.getItem();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title: Observer(builder: (_) {
              return Text(viewModel.item?.label ?? "");
            }),
            actions: [
              IconButton(
                onPressed: () async {
                  await Share.share('Check out this recipt ${viewModel.item!.url}}');
                },
                icon: Icon(Icons.share),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (viewModel.isItemFavorite) {
                await viewModel.removeFavoriteItem();
              } else {
                await viewModel.addFavoriteItem();
              }
            },
            child: Observer(builder: (_) {
              return viewModel.isItemFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
            }),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    child: viewModel.itemImage != null
                        ? Image.network(
                            viewModel.itemImage!,
                            fit: BoxFit.cover,
                          )
                        : Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: viewModel.itemImage == null,
                            child: Container(),
                          ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ingredients:",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Observer(builder: (_) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.item?.ingredients?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          minLeadingWidth: 80,
                          minVerticalPadding: 20,
                          leading: viewModel.item?.ingredients?[index].image != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    viewModel.item?.ingredients?[index].image ?? "",
                                  ),
                                  radius: 30,
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  enabled: viewModel.item?.ingredients?[index].image == null,
                                  child: Container(),
                                ),
                          title: Text(viewModel.item?.ingredients?[index].food ?? ""),
                          subtitle: Text(
                              viewModel.item?.ingredients?[index].foodCategory?.toString() ?? ""),
                          trailing:
                              Text(viewModel.item?.ingredients?[index].quantity?.toString() ?? ""),
                        ),
                      );
                    },
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Steps:",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Observer(builder: (_) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.item?.ingredientLines?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Text("${index + 1}.Step "),
                                title: Text(viewModel.item?.ingredientLines?[index] ?? ""),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
