import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/muyu_app_bar.dart';
import 'package:flutter_novice_village/muyu/countPanel.dart';
import 'muyuAssetsImage.dart';

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
          Expanded(child: CountPanel(count: 0, chooseMusic: (){}, chooseImage: (){})),
          Expanded(child: MuyuAssetsImage()),
        ],
      ),
    );
  }
}