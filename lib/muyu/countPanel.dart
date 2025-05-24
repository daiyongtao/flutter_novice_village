import 'package:flutter/material.dart';

// 上半部分视图
class CountPanel extends StatelessWidget {
  // 功德数
  final int count;
  // 选择音乐
  final VoidCallback chooseMusic;
  // 选择图片
  final VoidCallback chooseImage;

  const CountPanel({
    super.key,
    required this.count,
    required this.chooseMusic,
    required this.chooseImage
  });

  @override
  Widget build(BuildContext context) {
    // 按钮样式
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(40, 40), // 最小尺寸
      padding: EdgeInsets.zero, // 边距
      backgroundColor: Colors.green, // 背景色
      elevation: 0, // 阴影深度
    );

    return Stack(
      children: [
        Center(
          child: Text(
            "功德数: $count",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: chooseMusic,
                  child: Icon(Icons.music_note_outlined, color: Colors.white),
                ),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: chooseImage,
                  child: Icon(Icons.image, color: Colors.white),
                ),
              ],
            )
        )
      ],
    );
  }
}