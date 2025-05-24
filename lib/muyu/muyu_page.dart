import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/muyu_app_bar.dart';
import 'package:flutter_novice_village/muyu/count_panel.dart';
import 'animate_text.dart';
import 'muyu_assets_image.dart';

// 电子木鱼页
class MuyuPage extends StatefulWidget {
  const MuyuPage({super.key});
  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _counter = 0;
  int _cruValue = 0;
  final Random _random = Random();
  AudioPool? pool;

  @override
  void initState() {
    super.initState();
    _initAudioPool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MuyuAppBar(),
      body: Column(
        children: [
          // 平分上下两部分
          Expanded(child: CountPanel(count: _counter, chooseMusic: (){}, chooseImage: (){})),
          Expanded(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              MuyuAssetsImage(
                imagePath: "assets/images/muyu.png",
                onTap: _onKnock,
              ),
              if (_cruValue != 0) AnimateText(text: '功德+$_cruValue')
            ],
          )),
        ],
      ),
    );
  }

  void _onKnock() {
    pool?.start();
    setState(() {
      _cruValue = 1 + _random.nextInt(3);
      _counter += _cruValue;
    });
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool(
        'muyu_2.mp3',
        maxPlayers: 4
    );
  }
}