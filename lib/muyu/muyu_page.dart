import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
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
  int _counter = 0;
  final Random _random = Random();
  AudioPool? pool;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MuyuAppBar(),
      body: Column(
        children: [
          // 平分上下两部分
          Expanded(child: CountPanel(count: _counter, chooseMusic: (){}, chooseImage: (){})),
          Expanded(child: MuyuAssetsImage(
            imagePath: "assets/images/muyu.png",
            onTap: _onKnock,
          )),
        ],
      ),
    );
  }

  void _onKnock() {
    setState(() {
      pool?.start();
      int addCount = 1 + _random.nextInt(3);
      _counter += addCount;
    });
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool(
        'muyu_1.mp3',
        maxPlayers: 4
    );
  }
}