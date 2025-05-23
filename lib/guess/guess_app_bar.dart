import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCheck;
  final TextEditingController textEditingController;
  const GuessAppBar({
    super.key,
    required this.onCheck,
    required this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent
      ),
      leading: Icon( // 左侧
          Icons.menu, color: Colors.black
      ),
      title: Center(
        child: TextField( //中间部份
          keyboardType: TextInputType.number,
          decoration: InputDecoration( // 装饰
            filled: true, // 填充
            fillColor: Color(0xffF3F6F9), // 填充颜色
            constraints: BoxConstraints(maxHeight: 40), // 约束信息
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide.none
            ),
            hintText: "输入 0~99 数字", // 提示字
            hintStyle: TextStyle( // 提示字样式
              fontSize: 14,
            ),
          ),
          controller: textEditingController,
        ),
      ),
      actions: [ // 右侧列表
        IconButton(
            splashRadius: 20,
            onPressed: onCheck,
            icon: Icon(Icons.run_circle_outlined, color: Colors.blue)
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}