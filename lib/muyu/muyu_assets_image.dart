
// 下半部分视图
import 'package:flutter/material.dart';

class MuyuAssetsImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const MuyuAssetsImage({
    super.key,
    required this.imagePath,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector( // 使用 GestureDetector 组件监听手势回调
          onTap: onTap,
          child: Image.asset(
            imagePath,
            height: 200, //图片高度
          ),
        )
    );
  }
}
