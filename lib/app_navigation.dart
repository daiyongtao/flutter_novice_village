import 'package:flutter/material.dart';
import 'package:flutter_novice_village/app_bottom_bar/app_bottom_bar.dart';
import 'package:flutter_novice_village/app_bottom_bar/app_bottom_bar_item_data.dart';
import 'package:flutter_novice_village/guess/guess_page.dart';
import 'package:flutter_novice_village/muyu/muyu_page.dart';
import 'package:flutter_novice_village/paper/paper.dart';

import 'net_article/views/net_article_page.dart';

/// 整体页面结构（页面page + 底部bottomBar）
/// 切换bottomBar时，会切换page
class AppNavigation extends StatefulWidget {
  AppNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _index = 0;
  final PageController _pageController = PageController();
  
  final List<AppBottomBarItemData> itemDatas = const [
    AppBottomBarItemData(title: '猜数字', iconData: Icons.question_mark),
    AppBottomBarItemData(title: '电子木鱼', iconData: Icons.my_library_music_outlined),
    AppBottomBarItemData(title: '画板', iconData: Icons.palette_outlined),
    AppBottomBarItemData(title: '网络文章', iconData: Icons.article_outlined)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(_index),
      bottomNavigationBar: AppBottomBar(
          currentIndex: _index,
          itemDatas: itemDatas,
          onItemTap: _onChangePage)
    );
  }

  void _onChangePage(int index) {
    if (index != _index) {
      _pageController.jumpToPage(index);
      setState(() {
        _index = index;
      });
    }
  }

  Widget _buildContent(int index) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: const [
        GuessPage(),
        MuyuPage(),
        Paper(),
        NetArticlePage()
      ],
    );
  }
}