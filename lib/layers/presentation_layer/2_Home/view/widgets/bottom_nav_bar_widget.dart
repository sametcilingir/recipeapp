import 'package:flutter/material.dart';

import 'bottom_nav_bar_item_widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int>? onItemSelected;

  const BottomNavBarWidget({
    super.key,
    this.selectedIndex,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        BottomNavBarItemWidget(
            label: 'Favorites',
            icon: selectedIndex == 0 ? Icons.favorite : Icons.favorite_border,
            color: Colors.transparent,
            iconColor: selectedIndex == 0 ? Colors.white : Colors.grey,
            onPressed: () {
              onItemSelected?.call(0);
            }),
        BottomNavBarItemWidget(
            label: 'Search',
            icon: selectedIndex == 1 ? Icons.search : Icons.search_outlined,
            color: Colors.transparent,
            iconColor: selectedIndex == 1 ? Colors.white : Colors.grey,
            onPressed: () {
              onItemSelected?.call(1);
            }),
      ]),
    );
  }
}
