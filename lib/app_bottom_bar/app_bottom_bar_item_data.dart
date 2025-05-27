import 'package:flutter/cupertino.dart';

/// 底部导航栏抽象模型
class AppBottomBarItemData {
  /// item名称
  final String title;
  /// 图标
  final IconData iconData;

  const AppBottomBarItemData ({
    required this.title,
    required this.iconData
  });
}