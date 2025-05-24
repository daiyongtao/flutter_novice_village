import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*电子木鱼导航栏*/
class MuyuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MuyuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white
      ),
      titleTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        "电子木鱼",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [ // 右侧列表
        IconButton(
            splashRadius: 30,
            onPressed: _toHistory,
            icon: Icon(Icons.history, color: Colors.black)
        )
      ],
    );
  }

  void _toHistory() {
    print("哈哈 - 跳转进入历史记录");
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}