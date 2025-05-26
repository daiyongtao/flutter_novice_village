import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/history/merit_record.dart';
import 'package:flutter_novice_village/muyu/models/image_option.dart';
import 'package:flutter_novice_village/muyu/muyu_app_bar.dart';
import 'package:flutter_novice_village/muyu/count_panel.dart';
import 'package:flutter_novice_village/muyu/options/select_image.dart';
import 'animate_text.dart';
import 'models/voice_option.dart';
import 'muyu_assets_image.dart';
import 'options/select_voice.dart';
import 'package:uuid/uuid.dart';

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

  // ----- 选择图片选项 -----
  final List<ImageOption> imageOptions = const [
    ImageOption("基础版", "assets/images/muyu.png", 1, 3),
    ImageOption("尊享版", "assets/images/muyu_2.png", 3, 6),
  ];
  /// 木鱼默认选择为第0张图
  int _imageCurIndex = 0;
  /// 木鱼默认展示图
  String get imageSrc => imageOptions[_imageCurIndex].src;
  /// 每次敲击木鱼的增加值
  int get knockValue {
    int min = imageOptions[_imageCurIndex].min; // 3
    int max = imageOptions[_imageCurIndex].max; // 6
    return min + _random.nextInt(max + 1 - min); // 生成一个 min + (0 ~ max-min)的随机数
  }

  // ----- 选择音效选项 -----
  final List<VoiceOption> voiceOptions = const [
    VoiceOption('音效1', 'muyu_1.mp3'),
    VoiceOption('音效2', 'muyu_2.mp3'),
    VoiceOption('音效3', 'muyu_3.mp3'),
  ];
  int _voiceCurIndex = 0;
  /// 默认声音
  String get voiceSrc => voiceOptions[_voiceCurIndex].src;

  // ----- 选择图片选项 -----
  List<MeritRecord> _records = [];
  final Uuid uuid = Uuid();
  MeritRecord? _curRecord;

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
          Expanded(child: CountPanel(count: _counter, chooseMusic: _onTapSWitchVoice, chooseImage: _onTapSwitchImage)),
          Expanded(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              MuyuAssetsImage(
                imagePath: imageSrc,
                onTap: _onKnock,
              ),
              if (_cruValue != 0) AnimateText(record: _curRecord!)
            ],
          )),
        ],
      ),
    );
  }

  // 点击木鱼响应
  void _onKnock() {
    pool?.start();
    setState(() {
      // _random.nextInt(3) 生成一个 0～2的随机数
      _cruValue = knockValue;
      _counter += _cruValue;

      String id = uuid.v4();
      _curRecord = MeritRecord(
          id,
          DateTime.now().millisecondsSinceEpoch,
          _cruValue,
          imageSrc,
          voiceOptions[_voiceCurIndex].name);
      _records.add(_curRecord!);
    });
  }

  // 初始化音频播放器
  void _initAudioPool() async {
    pool = await FlameAudio.createPool(
        voiceSrc,
        maxPlayers: 4
    );
  }
  // 点击切换敲击声音
  void _onTapSWitchVoice() {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) {
      return VoiceOptionPanel(
          options: voiceOptions,
          onSelect: _onSelectVoice,
          activeIndex: _voiceCurIndex);
    });
  }

  // 点击切换图片
  void _onTapSwitchImage() {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) {
      return ImageOptionPanel(
          options: imageOptions,
          onSelect: _onSelectImage,
          activeIndex: _imageCurIndex);
    });
  }

  // 确认选择图片，弹窗界面弹下
  void _onSelectImage(int value) {
    Navigator.of(context).pop();
    if (value == _imageCurIndex) return;
    setState(() {
      _imageCurIndex = value;
    });
  }

  void _onSelectVoice(int value) async {
    Navigator.of(context).pop();
    if (value == _voiceCurIndex) return;
    _voiceCurIndex = value;

    pool = await FlameAudio.createPool(
      voiceSrc,
      maxPlayers: 1,
    );
  }
}