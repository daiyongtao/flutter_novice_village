import 'package:flutter/material.dart';
import 'package:flutter_novice_village/paper/line.dart';
import 'package:flutter_novice_village/paper/paper_app_bar/back_up_buttons.dart';

/*画板导航栏*/
class PaperAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClear; // 清除
  final VoidCallback? onBack; // 回退
  final VoidCallback? onRevocation; // 撤销回退
  final List<Line> lines;

  const PaperAppBar({
    super.key,
    required this.onClear,
    required this.lines,
    required this.onBack,
    required this.onRevocation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("画板绘制"),
      leading: BackUpButtons(onBack: onBack, onRevocation: onRevocation),
      leadingWidth: 100,
      actions: [ // 右侧列表
        IconButton(
          splashRadius: 30,
          onPressed: lines.isEmpty ? null : onClear,
          icon: Icon(Icons.delete_sharp),
          disabledColor: Colors.grey,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}