import 'package:flutter/material.dart';

/*画板导航栏*/
class PaperAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClear;

  const PaperAppBar({super.key, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        "画板绘制",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [ // 右侧列表
        IconButton(
            splashRadius: 30,
            onPressed: onClear,
            icon: Icon(Icons.delete_sharp)
        )
      ],
    );
  }

  void _delete(BuildContext context) {
    // 删除
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}