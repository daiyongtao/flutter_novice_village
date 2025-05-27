
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novice_village/app_bottom_bar/app_bottom_bar_item_data.dart';

/// 底部导航栏
class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<AppBottomBarItemData> itemDatas;
  final ValueChanged<int>? onItemTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.itemDatas,
    required this.onItemTap
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: onItemTap,
      currentIndex: currentIndex,
      elevation: 3,
      type: BottomNavigationBarType.fixed,
      iconSize: 22,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: itemDatas.map(_buildItemByItemData).toList(),
    );
  }

  BottomNavigationBarItem _buildItemByItemData(AppBottomBarItemData data) {
    return BottomNavigationBarItem(
        label: data.title,
        icon: Icon(data.iconData)
    );
  }
}