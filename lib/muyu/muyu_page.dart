import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/muyu_app_bar.dart';

// 电子木鱼页
class MuyuPage extends StatefulWidget {
  const MuyuPage({super.key});

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MuyuAppBar(),
      body: Column(
        children: [
          // 平分上下两部分
          Expanded(child: _buildTopContent()),
          Expanded(child: _buildImage()),
        ],
      ),
    );
  }
}

// 整体上半部分
Widget _buildTopContent() {
  // 按钮样式
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(36, 36), // 最小尺寸
    padding: EdgeInsets.zero, // 边距
    backgroundColor: Colors.green, // 背景色
    elevation: 0, // 阴影深度
  );

  return Stack(
    children: [
      Center(
        child: Text(
          "功德数: 0",
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
                child: Icon(Icons.music_note_outlined, color: Colors.white),
                onPressed: (){},
              ),
              ElevatedButton(
                style: buttonStyle,
                child: Icon(Icons.image, color: Colors.white),
                onPressed: (){},
              ),
            ],
          )
      )
    ],
  );
}

Widget _buildImage() {
  return Center(
      child: Image.asset(
        'assets/images/muyu.png',
        height: 200, //图片高度
      ));
}
