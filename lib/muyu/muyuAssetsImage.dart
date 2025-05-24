
// 下半部分视图
import 'package:flutter/material.dart';

class MuyuAssetsImage extends StatelessWidget {
  const MuyuAssetsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
          'assets/images/muyu.png',
          height: 200, //图片高度
        )
    );
  }
}
